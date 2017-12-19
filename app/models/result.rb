class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates :mark, presence: true, numericality: { only_integer: true, moroe_than_or_equal_to: 0 }

  scope :for, ->(student, exam) { where(student: student, exam: exam) }
  scope :passed, ->(exam, min) { where('exam_id = ?', exam).where('mark >= ?', min) }
  scope :failed, ->(exam, min) { where('exam_id = ?', exam).where('mark < ?', min) }
end
