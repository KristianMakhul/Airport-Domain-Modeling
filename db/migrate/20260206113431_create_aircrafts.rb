class CreateAircrafts < ActiveRecord::Migration[7.1]
  def change
    create_table :aircrafts do |t|
      t.string :model, null: false
      t.references :airline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
