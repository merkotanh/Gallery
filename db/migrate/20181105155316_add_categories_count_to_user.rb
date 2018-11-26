class AddCategoriesCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :categories_, :integer, default: 0
  end
end
