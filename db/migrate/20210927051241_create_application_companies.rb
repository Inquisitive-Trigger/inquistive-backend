class CreateApplicationCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :application_companies do |t|
      t.string :name
      t.string :detail
      t.string :reason
      t.string :contact_name
      t.string :phone_number
      t.string :contact_email
      t.string :string
      t.string :status_worker
      t.string :status_project
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
