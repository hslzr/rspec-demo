require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = create(:user)
  end


  describe '#validations' do
    context 'name' do
      it 'is present' do
        expect(@user.name).not_to be_empty
      end

      it 'only contains letters' do
        expect(@user.name).to match /\A[a-z]+\z/i
      end
    end

    context 'email' do
      it 'is present' do
        expect(@user.email).not_to be_empty
      end

      it 'belongs to Helicon employee' do
        expect(@user.email).to match /(\w\.?\w+)@hlcn.mx\z/
      end
    end
  end
end
