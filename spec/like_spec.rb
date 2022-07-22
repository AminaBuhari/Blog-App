require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Amina', photo: 'https://www.wix.com/', bio: 'giely')
  post = Post.create(user:, title: 'Post title', text: 'Post text', likes_counter: 1)

  it 'should increment post likes counter' do
    counter = post.likes_counter
    subject.save
    expect(post.likes_counter).to eq(counter)
  end
end
