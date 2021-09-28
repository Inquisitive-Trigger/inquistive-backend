class AddWishPersonToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :wish_person, :string
  end
end
