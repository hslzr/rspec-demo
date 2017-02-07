require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end


  describe '#validations' do
    context 'name' do
      it 'is present' do
        expect(@user.name).not_to be_empty
      end

      it 'only contains letters' do
        expect(@user.name).to match /\A[a-z]+\z/i
      end

      it 'is unique' do
        @user_two = FactoryGirl.build(:user)
        expect(@user_two).not_to be_valid
      end
    end

    context 'email' do
      it 'is present' do
        expect(@user.email).not_to be_empty
      end

      it 'belongs to Helicon employee' do
        expect(@user.email).to match /([a-z]\.\w+)@hlcn.mx\z/
      end
    end
  end
end
