require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.postscounter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.postscounter = 'string'
    expect(subject).to_not be_valid
  end

  it 'Method should return the 3 most recent posts' do
    3.times { Post.create(user: subject, title: 'Post title', text: 'Post text') }
    expect(subject.recent_posts.size).to eq(3)
  end
end
