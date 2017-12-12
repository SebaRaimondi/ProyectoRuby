class Course < ApplicationRecord
  has_many :evaluation
  has_many :student
end
