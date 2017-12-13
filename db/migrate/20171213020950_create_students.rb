class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.references :course, foreign_key: true
      t.string :surname
      t.string :name
      t.string :dni
      t.string :number
      t.string :email

      t.timestamps
    end
  end
end
