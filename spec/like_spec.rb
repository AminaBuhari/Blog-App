require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Amina', photo: 'https://www.wix.com/', bio: 'giely')
  post = Post.create(user:, title: 'Post title', text: 'Post text')

  subject { Like.new(user:, post:) }

  before { subject.save }

  it 'should increment post likes counter' do
    subject { Like.new(user:, post:) }
    counter = post.likes_counter
    subject.save
    expect(post.likes_counter).to eq(counter + 1)
  end

  it 'should validate_presence_of like' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

end
