class RemoveTypeFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :type, :boolean
  end
end
