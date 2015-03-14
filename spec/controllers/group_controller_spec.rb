require 'rails_helper'

RSpec.describe GroupController, type: :controller do


  describe "expected GroupController actions " do
    it "should respond to create" do
      GroupController.should respond_to(:create)
    end
    it "should respond to set_callback" do
      GroupController.should respond_to(:set_callback)
    end

    it "should respond to add_device" do
      GroupController.should respond_to(:add_device)
    end
    it "should respond to remove_device" do
      GroupController.should respond_to(:remove_device)
    end
    it "should respond to delete" do
      GroupController.should respond_to(:delete)
    end
  end

  describe "group api responses " do
    it "should render a numeric group id on create" do
      put :create
      expect(response).to be_success 
      response.body.should be_kind_of(Fixnum)
    end

    it "should accept a callback" do
      put :set_callback, {:callback => "http://beacon.example.com/"}
      expect(response).to be_success 
    end

    it "should add a device" do
      put :add_device, {:bluetooth_id => "abcdid123"}
      expect(response).to be_success 
    end

    it "should remove a device" do
      put :remove_device, {:bluetooth_id => "abcdid123"}
      expect(response).to be_success 
    end

    it "should delete itself" do
      g = Group.create()
      put :delete, {:id => g.id}
      expect(response).to be_success 
      expect(Group.find(g.id)).to be_nil
    end
  end
end
