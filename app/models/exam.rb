class Exam < ApplicationRecord
  belongs_to :course
  has_many :results
  has_many :students, through: :results
end
