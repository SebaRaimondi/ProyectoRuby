class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  scope :for, ->(student, exam) { where(student: student, exam: exam) }
end
