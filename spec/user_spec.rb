require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Amina', photo: 'https://wix.com/photos/F_0BxGuVvo', bio: 'Amina.') }

  before { subject.save }

  it 'should validate_presence_of user' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post_counter should be an integer' do
    subject.post_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'Method should return the 3 most recent posts' do
    3.times { Post.create(user: subject, title: 'Post title', text: 'Post text') }
    expect(subject.recent_posts.size).to eq(3)
  end
end
