require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "expected UserController actions " do
    it "should respond to create" do
      UserController.should respond_to(:create)
    end
  end


  describe "UserController api responses " do
    it "Creating a user should return the appropriate keys" do
      put :create
      expect(response).to be_success 
      result = JSON.parse(response.body)
      body.should include('admin_key')
      body.should include('client_key')

    end
  end

end
