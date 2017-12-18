class Course < ApplicationRecord
  has_many :exams
  has_many :students

  default_scope { order(year: :asc, title: :asc) }

  def update_results(params)
    h = params
    # h.each_pair do |_key, val|
    # val.delete_if { |_key, value| value.blank? }
    # end
    # h.delete_if { |_key, value| value.empty? }

    h.each_pair do |key, val|
      Exam.find(key).results(val)
    end
  end
end
