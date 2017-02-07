require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = create(:user)
  end


  describe '#validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:name) }

    it { should allow_value('Pablo').for(:name) }
    it { should allow_value('p.gonzalez@hlcn.mx').for(:email) }

    it { should_not allow_value('Pepe283').for(:name) }
    it { should_not allow_value('pepe283@hotmail.com').for(:email) }
  end
end
