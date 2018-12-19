require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  let(:user) {create(:user)}
  let(:category) {create(:category_with_images)}
  let(:images) { 4.times.map { create(:image2) } }

  before do 
    I18n.locale = 'en'
    @img = category.images.first
    sign_in user
  end
   
  let(:valid_attributes) do
    FactoryBot.attributes_for :images
  end
  let(:invalid_attributes) do
    { image: nil }
  end

  describe "GET #index" do
    it 'shows all images' do
      params = { images: category.images}
      get :index, params: params
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
    it 'response with success' do
      get :index
      expect(response).to be_successful
    end
    it 'assigns the images' do
      get :index
      expect(assigns(:images)).to include(category.images.first)
    end
  end

  describe 'GET #show' do
    it 'shows the image' do
      params = { id: category.images.first.id}
      get :show, params: params 
    end
    it 'renders the show template' do
      get :show, params: { id: category.images.first.id }
      expect(response).to render_template('show')
    end
    it 'responses with success with signed in user' do
      get :show, params: { id: category.images.first.id }
      expect(response).to be_successful
    end
    it 'responses with success without user' do
      sign_out user
      get :show, params: { id: category.images.first.id }
      expect(response).not_to be_successful
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: category.images.first.id }
    end
    it 'assigns the images' do
      expect(assigns(:image)).to eq(category.images.first)
    end
    it 'response with success' do
      expect(response).to be_successful
    end
    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do
    it 'new Image' do
      expect {
        post :create, params: { image: valid_attributes }
      }.to change(Image, :count).by(1)
    end
    it 'response with success' do
      post :create, params: { image: valid_attributes }
      expect(response.status).to eq(302)
    end
    it 'no redirects/ stays at the same page' do
      post :create, params: { image: invalid_attributes }
      expect(response).not_to eq(200)
    end
  end

  describe 'PUT #update' do
    let(:image_params) { FactoryBot.attributes_for(:image) }
    before do
      put :update, params: { id: @img.id, image: valid_attributes }
    end
    it 'redirects to certain image' do
      expect(response.status).to redirect_to(root_path)
    end
    # it 'assigns the image' do
    #   # expect(assigns(:image)).to eq(image)
    # end
    it 'updates the image' do
      @img.reload
      expect(@img.image_title).to  eq(valid_attributes[:image_title])
    end
  end

  describe 'DELETE #destroy' do
    before do
      @image = FactoryBot.create(:image1)
    end
    it 'image' do
      expect{
        delete :destroy, params: { id: @image.id }
      }.to change(Image, :count).by(0)
    end
    it 'after delete redirect to categories index' do
      delete :destroy, params: { id: @image.id }
      expect(response).to redirect_to root_path
    end
  end

  describe '#vote' do
    before do
      @image = FactoryBot.create(:image1)
      @image.liked_by user
    end
    it 'for image by User' do
      expect(user.liked? @image).to eq(true)
    end
    it 'against image by User' do
      @image.unliked_by user
      expect(user.liked? @image).to eq(false)
    end
  end

end
