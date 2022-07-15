require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end
end
RSpec.describe 'Test index action', type: :request do
  before(:example) { get users_path }
  it 'successful' do
    expect(response).to have_http_status(:ok)
  end
  it 'shows index' do
    expect(response).to render_template('index')
  end

  it 'placeholder text' do
    expect(response.body).to include('Here is a list of all users')
  end
end

RSpec.describe 'Test show action' do
  before(:example) do
    @user = User.create!(name: 'Tom', photo: 'https://i.ibb.co/n6R1Zh1/At-hospital.jpg', bio: 'Hospital.')
    get user_path(@user)
  end

  it 'successful login' do
    expect(response).to have_http_status(:ok)
  end
  it 'shows template' do
    expect(response).to render_template(:show)
  end

  it 'show placeholder text' do
    expect(response.body).to include('Here is a user')
  end
end
