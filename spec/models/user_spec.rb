require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
  end

  describe 'validation' do
    it { User.new }
  end
end
