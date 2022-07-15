require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe 'Test index action', type: :request do
  before(:example) do
    @user = User.create!(name: 'Tom', photo: 'https://i.ibb.co/n6R1Zh1/At-hospital.jpg', bio: 'Hospital.')
    get user_posts_path(@user)
  end
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it 'renders template' do
    expect(response).to render_template('index')
  end

  it 'should display the correct placeholder text' do
    expect(response.body).to include('Here is a list of all posts by a user')
  end
end

RSpec.describe 'Test index action' do
  before(:example) do
    @user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = @user.posts.create!(title: 'The ephicacy of things', text: 'Wow the ephicacy of things',
                                comments_counter: 0, likes_counter: 0)
    get user_post_path(@user, @post)
  end
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it 'renders 'show' template' do
    expect(response).to render_template(:show)
  end

  it 'should display the correct placeholder text' do
    expect(response.body).to include('Here is a post by username')
  end
end
