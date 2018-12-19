require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:categories) { 4.times.map { build(:categories) } }
  let(:category) { create(:category) }
  let(:user) { create(:random_user) }
    
  before do 
    I18n.locale = 'en'
    sign_in user
  end

  describe "GET #index" do
    it 'shows all categories' do
      params = { categories: categories}
      get :index, params: params 
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
    it 'response with success' do
      sign_out user
      get :index
      expect(response).to be_successful
    end
    it 'assigns the categories' do
      get :index
      expect(assigns(:categories)).to include(category)
    end
  end

  describe 'GET #show' do
    it 'shows the category' do
      params = { id: category.id}
      get :show, params: params 
    end
    it 'renders the show template' do
      get :show, params: { id: category.id }
      expect(response).to render_template('show')
    end
    it 'responses with success with signed in user' do
      get :show, params: { id: category.id }
      expect(response).to be_successful
    end
    it 'assigns the categories' do
      get :show, params: { id: category.id }
      expect(assigns(:categories)).to include(category)
    end
    it 'responses with success withour user' do
      sign_out user
      get :show, params: { id: category.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'new Category' do
      expect {
        post :create, params: { category: FactoryBot.attributes_for(:category) }
      }.to change(Category, :count).by(1)
    end
    it 'responses with success' do
      post :create, params: { category: FactoryBot.attributes_for(:category) }
      expect(response.status).to eq(200)
    end
    it 'redirects when user not signed in' do
      sign_out user
      post :create
      expect(response.status).to eq(302)
    end
    # it 'redirects' do
    #   sign_out user
    #   post :create
    #   # expect(response).to redirect_to(new_user_session_path) # redirects with locale< expects without locale
    # end
  end

  describe 'PUT #update' do
    let(:category_params) { FactoryBot.attributes_for(:category) }
    before do
      put :update, params: { id: category.id, category: category_params }
    end
    it 'redirects to certain category' do
      expect(response.status).to eq(302)
    end
    it 'redirects to certain category' do
      expect(response.status).to redirect_to(category_path)
    end
    it 'assigns the category' do
      expect(assigns(:category)).to eq(category)
    end
    it 'updates the category' do
      category.reload
      expect(category).to having_attributes(name:'name')
    end
  end

  describe 'DELETE #destroy' do
    before do
      @category = FactoryBot.create(:category)
    end
    it 'category' do
      expect{
        delete :destroy, params: { id: @category.id }
      }.to change(Category, :count).by(0)
    end

    it 'after delete redirect to categories index' do
      delete :destroy, params: { id: @category.id }
      expect(response).to redirect_to images_path
    end
  end

end
