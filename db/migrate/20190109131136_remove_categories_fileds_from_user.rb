class RemoveCategoriesFiledsFromUser < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :about
  	remove_column :users, :categories_count
  	remove_column :users, :categories_id
  end
end
