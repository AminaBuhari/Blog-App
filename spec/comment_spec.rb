require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(user:, title: 'Hello', text: 'This is my first post')

  subject { Comment.new(user:, post:, text: 'Comment text') }

  before { subject.save }

  it 'should validate_presence_of comment' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should increment post comments counter' do
    counter = post.comments_counter
    subject.save
    expect(post.comments_counter).to eq(counter)
  end
  it 'comment should not have morethan 250 characters' do
    subject.comment = 'a' * 255
    expect(subject).to_not be_valid
  end

  it 'like_counter should be greater than or equal to 0' do
    subject.like_counter = -1
    expect(subject).to_not be_valid
  end

  it 'like_counter should be an integer' do
    subject.like_counter = 'string'
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
