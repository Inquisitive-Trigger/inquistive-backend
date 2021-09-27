class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.string :concept
      t.time :deadline
      t.integer :reward
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
