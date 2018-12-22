ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Categories" do
          table_for  Category.order(created_at: :desc).limit(15) do
            column :id
            column 'Category name', :name do |category|
              link_to category.name, admin_category_path(category)
            end
            column :created_at
             #Category.each.map do |category|
             #   category.name
            #end
          end
        end
      end

      column do
        panel "Recent Images" do
          table_for Image.order(created_at: :desc).limit(15) do
            column :id
            column 'Image', :image_title do |image|
              link_to(image.image_title,  admin_image_path(image))
            end
            column 'Image', :image_url do |image|
              image_tag image.image_url(:thumbnail)
            end
            column :created_at
          end
        end
      end

    @comments = Comment.order(created_at: :desc).limit(15)
       column do
         panel "Recent Comment" do
          ul do
            @comments.each.map do |comment|
              li link_to(comment.body,  admin_comment_path(comment))
            end
          end
         end
       end
    end #columns
  end # content
end
