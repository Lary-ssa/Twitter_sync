require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username)} 
  end
  describe 'sincronization' do
    let(:username) { 'rails' }
    before do 
      create(:user, username: username)
    end 

    it 'Create last messages with Twitter api response' do
      VCR.use_cassette('twitter_api') do
        expect(User.sync_all.count).to eql(20) 
      end
    end
  end 
end
