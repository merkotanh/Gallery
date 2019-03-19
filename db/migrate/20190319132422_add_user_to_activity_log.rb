class AddUserToActivityLog < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_logs, :user, :string
  end
end
