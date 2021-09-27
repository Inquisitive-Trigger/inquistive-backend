class AddPurposeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :purpose, :boolean
  end
end
