class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.string :seat_number, null: false
      t.integer :cabin_class, null: false
      t.references :aircraft, null: false, foreign_key: true

      t.timestamps
    end

    add_index :seats, [:aircraft_id, :seat_number], unique: true
  end
end
