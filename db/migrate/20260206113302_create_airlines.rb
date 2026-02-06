class CreateAirlines < ActiveRecord::Migration[7.1]
  def change
    create_table :airlines do |t|
      t.string :name, null: false
      t.string :code, null: false

      t.timestamps
    end

    add_index :airlines, :code, unique: true
  end
end
