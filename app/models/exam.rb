class Exam < ApplicationRecord
  belongs_to :course
  has_many :results
  has_many :students, through: :results

  validates :title, presence: true, length: { maximum: 255 }
  validates :min, presence: true, numericality: { moroe_than_or_equal_to: 0, only_integer: true }

  default_scope { order(date: :asc, title: :asc) }

  def results_update(params)
    params.each_pair do |key, val|
      s = Student.find(key)
      r = Result.for(s, self).first
      if r
        r.mark = val
        r.save
      else
        Result.create(student_id: s.id, exam_id: id, mark: val)
      end
    end
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
