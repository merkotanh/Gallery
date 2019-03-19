ActiveAdmin.register Comment, as: "UserComment" do

 permit_params :body, :image_id, :user_id, :created_at, :updated_at

end
