class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :result
      t.references :student, foreign_key: true
      t.references :evaluation, foreign_key: true

      t.timestamps
    end
  end
end
