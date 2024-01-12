require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create(name: "John",age: 25) }
  it 'is valid with a title and body' do
    article = Article.new(title: "some article", body: "create a some article with user", user_id: user.id)
    expect(article).to be_valid
  end
  it 'is invalid without a body' do
    article = Article.new(user_id: user.id)
    expect(article).to_not be_valid
  end
end
