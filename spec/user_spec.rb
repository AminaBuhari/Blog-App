require 'rails_helper'
RSpec.describe 'Users', type: :system do
  describe 'index' do
    before :all do
      User.destroy_all
      Post.destroy_all
    end
    before :each do
      @author1 = User.create(name: 'User1',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Bio1',
                             post_counter: 0)
      @author2 = User.create(name: 'User2',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Bio2',
                             post_counter: 0)
      @post1 = Post.create(user: @author1, title: 'Post1', text: 'Text1')
      @post2 = Post.create(user: @author2, title: 'Post2', text: 'Text2')
      @post3 = Post.create(user: @author2, title: 'Post3', text: 'Text3')
      @comment1 = Comment.create(text: 'Comment1', user: @author2, post: @post1)
      @comment2 = Comment.create(text: 'Comment2', user: @author2, post: @post1)
      @likes1 = Like.create(user: @author1, post: @post2)
      @likes2 = Like.create(user: @author2, post: @post1)
      visit '/users'
    end
    it 'I can see the username of all other users' do
      expect(page).to have_content('User1')
      expect(page).to have_content('User2')
    end
    it 'I can see the profile picture for each user' do
      expect(page).to have_selector('img', count: 2)
    end
    it 'I can see the number of posts each user has written' do
      expect(page).to have_content('1')
      expect(page).to have_content('2')
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'User1'
      expect(page).to have_content('User1')
    end
  end
  describe 'show' do
    before :all do
      User.destroy_all
      Post.destroy_all
    end
    before :each do
      @author1 = User.create(name: 'User1',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Bio1',
                             post_counter: 0)
      @author2 = User.create(name: 'User2',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Bio2',
                             post_counter: 0)
      @post1 = Post.create(user: @author1, title: 'Post1', text: 'Text1')
      @post2 = Post.create(user: @author1, title: 'Post2', text: 'Text2')
      @post3 = Post.create(user: @author1, title: 'Post3', text: 'Text3')
      @comment1 = Comment.create(text: 'Comment1', user: @author2, post: @post1)
      @comment2 = Comment.create(text: 'Comment2', user: @author2, post: @post1)
      @comment2 = Comment.create(text: 'Comment3', user: @author2, post: @post2)
      @likes1 = Like.create(user: @author2, post: @post1)
      @likes2 = Like.create(user: @author2, post: @post2)
      visit '/users'
      click_link 'User1'
    end
    it 'I can see the user\'s profile picture' do
      expect(page).to have_selector('img')
    end
    it 'I can see the user\'s username' do
      expect(page).to have_content('User1')
    end
    it 'I can see the number of posts the user has written' do
      expect(page).to have_content('3')
    end
    it 'I can see the user\'s bio' do
      expect(page).to have_content('Bio1')
    end
    it 'I can see the user\'s first 3 posts' do
      expect(page).to have_content('Post1')
      expect(page).to have_content('Post2')
      expect(page).to have_content('Post3')
    end
    it 'I can see a button that lets me view all of a user\'s posts' do
      expect(page).to have_content('See all posts')
    end
    it 'When I click a user\'s post, it redirects me to that post\'s show page' do
      click_link 'Post2'
      expect(page).to have_current_path user_post_path(@author1, @post2)
    end
    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@author1)
    end
  end
end
