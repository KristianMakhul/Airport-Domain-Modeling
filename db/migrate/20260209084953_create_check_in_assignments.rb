class CreateCheckInAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :check_in_assignments do |t|
      t.references :check_in_counter, null: false, foreign_key: true
      t.references :flight_instance, null: false, foreign_key: true

      t.datetime :active_from, null: false
      t.datetime :active_to, null: false

      t.timestamps
    end
  end
end
