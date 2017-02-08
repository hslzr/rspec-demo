require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @tweet = FactoryGirl.create(:tweet, user: @user)
  end

  describe 'validations' do
    context 'content' do
      it 'has a maximum length of 140 characters' do
        expect(@tweet.content.length).not_to be > 140
      end
    end
  end

  describe 'associations' do
    it 'belongs_to a user' do
      expect(@tweet.user).to be_a User
    end
  end

  describe '#remove_trailing_whitespace' do
    it 'removes trailing whitespace from tweet\'s content' do
      tweet = FactoryGirl.create(:tweet, content: "   whitespace removed   ", user: @user)
      tweet.valid?
      expect(tweet.content).to eq "whitespace removed"
    end
  end
end
