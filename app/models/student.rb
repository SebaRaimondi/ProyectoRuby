class Student < ApplicationRecord
  belongs_to :course
  has_many :results
  has_many :exams, through: :results

  number_regex = /\A[1-9]\d{0,6}.[\/][1-9]\d{0,2}\z/

  number_message = 'El legajo ingresado no es valido.'
  email_message = 'El email ingresado no es valido.'

  validates :surname, presence: true, length: { maximum: 255 }

  validates :name, presence: true, length: { maximum: 255 }

  validates :dni, presence: true, length: { minimum: 5, maximum: 8 }

  validates :number, presence: true, length: { maximum: 255 },
                     format: { with: number_regex, message: number_message }

  validates :email, presence: true, length: { maximum: 255 },
                    email_format: { message: email_message }

  default_scope { order(surname: :asc, name: :asc) }

  before_save :titleize_names

  def titleize_names
    self.name = name.titleize
    self.surname = surname.titleize
  end

  def mark_for(exam)
    exam.mark_for(self)
  end

  def full_name
    "#{surname}, #{name}"
  end
end
