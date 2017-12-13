class Student < ApplicationRecord
  belongs_to :course
  validates :email, email_format: { message: 'El email ingresado no es valido.' }
  validates :number, format: { with: /\A[1-9]\d{0,6}.[\/][1-9]\d{0,2}\z/,
                               message: 'El legajo ingresado no es valido.' }
end
