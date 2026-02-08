class CreateGateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :gate_assignments do |t|
      t.references :gate, null: false, foreign_key: true
      t.references :flight_instance, null: false, foreign_key: true

      t.datetime :active_from, null: false
      t.datetime :active_to, null: false

      t.timestamps
    end

    add_index :gate_assignments, [:gate_id, :active_from, :active_to], name: "index_gate_time_range"
  end
end
