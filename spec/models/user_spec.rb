require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { User.new }
  end
end
