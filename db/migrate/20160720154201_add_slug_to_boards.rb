class AddSlugToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :slug, :string, null: false
  end
end
