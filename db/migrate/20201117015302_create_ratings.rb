class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.references :airplane, null: false, foreign_key: true
      t.references :renter, references: :users, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
