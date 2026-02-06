class CreateCheckInCounters < ActiveRecord::Migration[7.1]
  def change
    create_table :check_in_counters do |t|
      t.string :code, null: false
      t.references :terminal, null: false, foreign_key: true

      t.timestamps
    end

    add_index :check_in_counters, [:terminal_id, :code], unique: true
  end
end
