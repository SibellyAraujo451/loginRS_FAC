require 'rails_helper'

RSpec.describe User, type: :model do
  it { should define_enum_for(:role).with_values(user: 0, admin: 1) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe "factory" do
    it "has a valid factory for user" do
      expect(build(:user)).to be_valid
    end

    it "has a valid factory for admin" do
      expect(build(:admin)).to be_valid
    end
  end
end
