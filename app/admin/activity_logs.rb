ActiveAdmin.register ActivityLog do

permit_params  :user_id, :browser, :ip_address, :controller, :action, :params, :note

end