class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :flight_number, null: false
      t.references :airline, null: false, foreign_key: true
      t.references :origin_airport, null: false, foreign_key: { to_table: :airports }
      t.references :destination_airport, null: false, foreign_key: { to_table: :airports }

      t.timestamps
    end

    add_index :flights, [:airline_id, :flight_number], unique: true
  end
end
