require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  # Default attributes
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:auth_token) }

   it { should be_valid }

  # Attribute validate
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should validate_uniqueness_of(:auth_token) }
  it { should allow_value('example@domain.com').for(:email) }

end
