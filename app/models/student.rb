class Student < ApplicationRecord
  belongs_to :course
  has_many :evaluations, through: :results
end
