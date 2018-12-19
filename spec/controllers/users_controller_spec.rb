require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:user) { create(:user) }

  before do
    I18n.locale = 'ru'
    sign_in user
    @params = { id: user.id, username: user.username, avatar: 'avatar' }
  end

  describe 'GET #show' do
    it 'renders the template' do
      @params = { id: user.id}
      get :show, params: @params
      expect(response).to render_template('show')
    end
    it 'response success' do
      @params = { id: user.id}
      get :show, params: @params
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: @params
    end
    it 'renders the template' do
      expect(response).to render_template('edit')
    end
    it 'response success' do
      expect(response).to be_successful
    end
    it 'saves and assigns user to @user' do
      expect(assigns(:user)).to eq user
    end
  end

end
