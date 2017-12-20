class Course < ApplicationRecord
  has_many :exams
  has_many :students
  validates :year, presence: true, numericality: :only_integer
  validates :title, presence: true, length: { maximum: 255 }

  default_scope { order(year: :asc, title: :asc) }

  before_save :titleize_title

  def update_results(params)
    params.each_pair do |key, val|
      exams.where(id: key).first.update_results(val)
    end
  end

  def full_title
    "#{title} - #{year}"
  end

  def titleize_title
    self.title = title.titleize
  end
end
