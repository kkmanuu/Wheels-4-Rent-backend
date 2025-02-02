require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end

  describe 'associations' do
    it { should have_many(:reservations).dependent(:destroy) }
  end
end
