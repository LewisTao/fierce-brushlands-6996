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

  # Create action
  describe "POST #create" do
    # Success create new user
    context "success create new user" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, user: @user_attributes
      end

      it "return user information just create" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @user_attributes[:email]
      end
    end

    # Un-success create new user
    context "un-success create new user" do
      before(:each) do
        @invalid_attributes = { email: 'abc', password: 'password', password_confirmation: 'password' }
        post :create, user: @invalid_attributes
      end

      it "return errors messages why can not create new user" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include 'wrong email address'
      end
    end
  end
end
