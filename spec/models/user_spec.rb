require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'when creating a user' do
    let(:user) {build :user}

    it 'should be vaild user with all attributes ' do 
      expect(user.valid?).to eq(false)
    end
  end
end
