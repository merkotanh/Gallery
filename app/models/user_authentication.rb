class UserAuthentication < ApplicationRecord
  belongs_to :user
  belongs_to :authentication_provider
  serialize :params
end
