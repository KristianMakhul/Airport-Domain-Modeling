class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :passenger, null: false, foreign_key: true
      t.references :flight_instance, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true

      t.boolean :checked_in, default: false

      t.timestamps
    end

    add_index :tickets, [:flight_instance_id, :seat_id], unique: true
  end
end
