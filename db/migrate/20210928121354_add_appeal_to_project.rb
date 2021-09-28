class AddAppealToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :appeal, :string
  end
end
