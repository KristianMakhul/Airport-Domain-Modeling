class CreateAirports < ActiveRecord::Migration[7.1]
  def change
    create_table :airports do |t|
      t.string :name, null: false
      t.string :code, null: false

      t.timestamps
    end
  end
end
