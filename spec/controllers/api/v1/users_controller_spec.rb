require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  # Show action
  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id
    end

    it "return correct user information" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end
  end
end
