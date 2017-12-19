class Student < ApplicationRecord
  belongs_to :course
  has_many :results
  has_many :students, through: :results

  dni_regex = /^[XYZ]?\d{5,8}[A-Z]$/
  number_regex = /\A[1-9]\d{0,6}.[\/][1-9]\d{0,2}\z/

  dni_message = 'El dni no es valido.'
  number_message = 'El legajo ingresado no es valido.'
  email_message = 'El email ingresado no es valido.'

  validates :surname, presence: true, length: { maximum: 255 }

  validates :name, presence: true, length: { maximum: 255 }

  validates :dni, presence: true, length: { maximum: 255 },
                  format: { with: dni_regex, message: dni_message }

  validates :number, presence: true, length: { maximum: 255 },
                     format: { with: number_regex, message: number_message }

  validates :email, presence: true, length: { maximum: 255 },
                    email_format: { message: email_message }

  default_scope { order(surname: :asc, name: :asc) }

  def mark_for(exam)
    (Result.for self, exam).first.mark
  end
end
