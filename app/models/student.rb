class Student < ApplicationRecord
  belongs_to :course
  has_many :results
  has_many :students, through: :results

  validates :email, email_format: { message: 'El email ingresado no es valido.' }
  validates :number, format: { with: /\A[1-9]\d{0,6}.[\/][1-9]\d{0,2}\z/,
                               message: 'El legajo ingresado no es valido.' }

  default_scope { order(surname: :asc, name: :asc) }

  def mark_for(exam)
    (Result.for self, exam).first.mark
  end
end
