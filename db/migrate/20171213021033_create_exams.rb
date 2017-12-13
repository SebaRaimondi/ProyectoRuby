class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.references :course, foreign_key: true
      t.string :title
      t.date :date
      t.integer :min

      t.timestamps
    end
  end
end
