class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates :mark, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  scope :for, ->(student, exam) { where(student: student, exam: exam) }
  scope :passed, ->(exam, min) { where('exam_id = ?', exam).where('mark >= ?', min) }
  scope :failed, ->(exam, min) { where('exam_id = ?', exam).where('mark < ?', min) }
end
