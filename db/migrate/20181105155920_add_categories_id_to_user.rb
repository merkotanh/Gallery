class AddCategoriesIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :categories_id, :integer, default: 0
  end
end
