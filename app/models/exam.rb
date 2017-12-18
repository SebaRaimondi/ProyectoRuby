class Exam < ApplicationRecord
  belongs_to :course
  has_many :results
  has_many :students, through: :results

  default_scope { order(date: :asc, title: :asc) }

  def results(params)
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
end
