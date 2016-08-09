class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.integer :board_id, null: false
      t.string :title, null: false
      t.text :summary, null: false
      t.timestamps
    end
  end
end
