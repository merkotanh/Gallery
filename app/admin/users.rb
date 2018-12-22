ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

permit_params :username, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :avatar, :slug


  # find record with slug(friendly_id)
  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  # show do
  #   attributes_table do
  #     row "Avatar" do |user|
  #       image_tag user.avatar.url(:profile)
  #     end
  #   end
  # end

  # @user.avatar.url(:profile)


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
