ActiveAdmin.register ActivityLog do

config.batch_actions = false

permit_params  :user_id, :user, :browser, :ip_address, :controller, :action, :params, :note, :created_at, :updated_at

end
