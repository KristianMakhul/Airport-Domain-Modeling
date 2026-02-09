class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :pnr, null: false

      t.timestamps
    end

    add_index :bookings, :pnr, unique: true
  end
end
