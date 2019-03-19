ActiveAdmin.register Image do

 permit_params :image, :image_title, :image_description, :category_id, :cached_votes_up, :cached_votes_score, :cached_votes_total

end
