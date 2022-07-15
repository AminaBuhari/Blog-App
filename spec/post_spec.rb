require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Amina', photo: 'https://unsplash.com/photos/F_0BxGuVvo', bio: 'girl')

  subject { Post.new(user:, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  it 'should validate_presence_of post' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not have morethan 250 characters' do
    subject.title = 'a' * 255
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 'string'
    expect(subject).to_not be_valid
  end

  it ':recent_comments should return 5 recent comments' do
    5.times { Comment.create(user:, post: subject, text: 'Comment text') }
    expect(subject.recent_comments.size).to eq(5)
  end

  it 'Method should return the updated post_counter' do
    subject.user = User.new(name: 'Demo User', post_counter: 0)
    post_counter = subject.user.post_counter
    subject.update_post_counter
    expect(subject.user.post_counter).to eq(post_counter + 1)
  end
end
