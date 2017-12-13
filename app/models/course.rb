class Course < ApplicationRecord
  has_many :exams
  has_many :students
end
