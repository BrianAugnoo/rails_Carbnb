class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :colour
      t.integer :year
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
