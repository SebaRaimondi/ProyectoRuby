class Exam < ApplicationRecord
  belongs_to :course
  has_many :results
  has_many :students, through: :results

  validates :title, presence: true, length: { maximum: 255 }

  validates :min, presence: true,
                  numericality: { moroe_than_or_equal_to: 0, only_integer: true }

  validate :date_validation

  default_scope { order(date: :asc, title: :asc) }

  before_save :titleize_title

  def titleize_title
    self.title = title.titleize
  end

  def update_results(params)
    params.each_pair do |key, val|
      r = results.where(exam_id: id, student_id: key).first
      if r
        r.mark = val
        r.save
      else
        Result.create(student_id: key, exam_id: id, mark: val)
      end
    end
  end

  def date_validation
    errors.add(:date, 'La fecha no es valida.') unless date_valid?
  end

  def date_valid?
    date.between?(Date.new(course.year), Date.new(course.year + 1))
  end

  def mark_for(s)
    results.where(student_id: s.id).first.mark
  end

  def has_mark_for(s)
    !results.where(student_id: s.id).where('mark <> ""').empty?
  end

  def passed?(s)
    has_mark_for(s) && mark_for(s) >= min
  end

  def passed
    results.where('mark >= ?', min)
  end

  def failed
    results.where('mark < ?', min)
  end

  def not_present
    results - (passed + failed)
  end

  def pass_percent
    return 0 if passed.count + failed.count == 0
    passed.count.to_f / (passed.count + failed.count) * 100
  end
end
