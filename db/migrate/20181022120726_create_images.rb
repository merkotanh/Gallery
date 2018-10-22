class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image
      t.string :image_title
      t.string :image_file_size
      t.text :image_description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
