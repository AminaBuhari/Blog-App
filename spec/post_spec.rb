require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'index' do
    before :all do
      Post.destroy_all
      User.destroy_all
    end

    before(:each) do
      @author1 = User.create(name: 'User1',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Bio1',
                             post_counter: 0)
      @author2 = User.create(name: 'User2',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Bio2',
                             post_counter: 0)

      @post1 = Post.create(title: 'Hello', text: 'This is my first post', author_id: @author1.id, user_id: @author1.id)

      @comment1 = Comment.create(text: 'Comment1', user: @author2, post: @post1)

      @likes1 = Like.create(user: @author1, post: @post2)
      @likes2 = Like.create(user: @author2, post: @post1)

      visit '/users'
      click_link 'User1'
      click_link 'See all posts'
    end

    it 'I can see the user\'s profile picture' do
      expect(page).to have_selector('img')
    end

    it 'I can see the user\'s username' do
      expect(page).to have_content('User1')
    end

    it 'I can see the number of posts the user has written' do
      expect(page).to have_content('1')
    end

    it 'I can see a postt\'s title' do
      expect(page).to have_content('Hello')
    end

    it 'I can see some of the post\'s body' do
      expect(page).to have_content('This is my first post')
    end

    it 'I can see the first comments on a post' do
      expect(page).to have_content('Comment1')
    end

    it 'I can see how many comments a post has' do
      expect(page).to have_content('Comments 1')
    end

    it 'I can see how many likes a post has' do
      expect(page).to have_content('1')
    end

    it 'I can see a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Next Page')
    end

    it 'When I click on a post, it redirects me to that post\'s show page' do
      click_link 'Hello'
      expect(page).to have_current_path user_post_path(@author1, @post1)
    end
  end

  describe 'show' do
    before :all do
      Post.destroy_all
      User.destroy_all
    end

    before(:each) do
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

      @comment1 = Comment.create(text: 'Comment1', user: @author2, post: @post1)
      @comment2 = Comment.create(text: 'Comment2', user: @author2, post: @post1)

      @likes1 = Like.create(user: @author1, post: @post2)
      @likes2 = Like.create(user: @author2, post: @post1)

      visit '/users'
      click_link 'User1'
      click_link 'Post1'
    end

    it 'I can see the post\'s title' do
      expect(page).to have_content('Post1')
    end

    it 'I can see who wrote the post' do
      expect(page).to have_content('User1')
    end

    it 'I can see how many comments it has' do
      expect(page).to have_content('2')
    end

    it 'I can see how many likes it has' do
      expect(page).to have_content('1')
    end

    it 'I can see the post body' do
      expect(page).to have_content('Text1')
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content('User2:')
    end

    it 'I can see the comment each commentor left' do
      expect(page).to have_content('Comment1')
      expect(page).to have_content('Comment2')
    end
  end
end
