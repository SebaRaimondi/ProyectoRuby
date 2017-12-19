class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates :mark, presence: true, numericality: { only_integer: true, moroe_than_or_equal_to: 0 }

  scope :for, ->(student, exam) { where(student: student, exam: exam) }
end
