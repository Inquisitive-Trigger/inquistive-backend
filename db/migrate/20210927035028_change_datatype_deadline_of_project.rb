class ChangeDatatypeDeadlineOfProject < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :deadline, :datetime
  end
end
