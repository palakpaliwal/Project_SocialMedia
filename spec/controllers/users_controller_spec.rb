require 'rails_helper' 

RSpec.describe UsersController do
  describe 'GET index' do
    let(:user) {create :user}
    before(:each) do 
     sign_in(user)
    end
    it 'assigns all users to @users' do
      get :index 
      expect(:users).to eq([user])
    end
  end
end