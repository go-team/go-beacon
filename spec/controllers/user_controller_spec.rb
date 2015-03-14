require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "expected UserController actions " do
    it "should respond to create" do
      expect(UserController.new).to respond_to(:create)
    end
  end


  describe "UserController api responses " do
    it "Creating a user should return the appropriate keys" do
      put :create
      expect(response).to be_success 
      result = JSON.parse(response.body)
      expect(result).to include('admin_key')
      expect(result).to include('client_key')
      expect(result['admin_key'].length).to be  >= 20
      expect(result['client_key'].length).to be  >= 20
    end
  end

end
