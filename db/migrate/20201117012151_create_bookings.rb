class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :status, default: "pending"
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :renter, references: :users, foreign_key: {to_table: :users}
      t.references :airplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
