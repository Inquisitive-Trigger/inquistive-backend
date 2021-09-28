class AddCompanyUrlToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :company_url, :string
  end
end
