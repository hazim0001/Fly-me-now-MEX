class CreateAirplanes < ActiveRecord::Migration[6.0]
  def change
    create_table :airplanes do |t|
      t.integer :capacity
      t.string :model
      t.float :price
      t.boolean :booked, default: false
      t.float :rating, default: 0
      t.references :owner, references: :users, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
