class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :students, through: :results
end
