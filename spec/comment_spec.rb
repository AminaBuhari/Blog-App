require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(user:, title: 'Hello', text: 'This is my first post')

  subject { Comment.new(user:, post:, text: 'Comment text') }

  before { subject.save }

  it 'should increment post comments counter' do
    counter = post.comments_counter
    subject.save
    expect(post.comments_counter).to eq(counter)
  end
end