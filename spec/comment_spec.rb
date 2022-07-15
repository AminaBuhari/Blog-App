require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'amina', photo: 'https://wix.com/photos/F_0BxGuVvo', bio: 'amina.')
  post = Post.create(user:, title: 'Hello', text: 'This is my first post')

  subject { Comment.new(user:, post:, text: 'Comment text') }

  before { subject.save }

  it 'should validate_presence_of comment' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'should increment post comments counter' do
    counter = post.comments_counter
    subject.save
    expect(post.comments_counter).to eq(counter)
  end
  it 'comment should not have morethan 250 characters' do
    subject.text = 'a' * 256
    expect(subject).to_not be_valid
  end
end
