class CreateTerminals < ActiveRecord::Migration[7.1]
  def change
    create_table :terminals do |t|
      t.string :code, null: false
      t.references :airport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
