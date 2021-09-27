class AddCategoryToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :category, :string
  end
end
