class CreateBaggages < ActiveRecord::Migration[7.1]
  def change
    create_table :baggages do |t|
      t.string :tag_number, null: false
      t.decimal :weight_kg, null: false
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end

    add_index :baggages, :tag_number, unique: true
  end
end
