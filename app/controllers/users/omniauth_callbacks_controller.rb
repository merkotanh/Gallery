  class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    include OmniConcern
    %w[facebook google_oauth2 github].each do |meth|
      define_method(meth) do
        create
      end
    end
  end