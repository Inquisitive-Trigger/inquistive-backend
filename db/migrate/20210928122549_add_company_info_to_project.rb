class AddCompanyInfoToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :company_info, :string
  end
end
