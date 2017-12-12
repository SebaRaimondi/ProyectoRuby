class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.boolean :active
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
