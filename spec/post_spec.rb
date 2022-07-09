require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_0BxGuVvo', bio: 'Teacher from Mexico.')

  subject { Post.new(user:, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  it 'title should be present' do
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

  it 'Method should return the updated posts_counter' do
    counter = user.postscounter
    subject.save
    expect(user.postscounter).to eq(counter + 1)
  end
end
