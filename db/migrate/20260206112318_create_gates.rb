class CreateGates < ActiveRecord::Migration[7.1]
  def change
    create_table :gates do |t|
      t.string :code, null: false
      t.references :terminal, null: false, foreign_key: true

      t.timestamps
    end

    add_index :gates, [:terminal_id, :code], unique: true
  end
end
