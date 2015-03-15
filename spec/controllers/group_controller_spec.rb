require 'rails_helper'

RSpec.describe GroupController, type: :controller do


  describe "expected GroupController actions " do
    it "should respond to create" do
      GroupController.new.should respond_to(:create)
    end
    it "should respond to set_callback" do
      GroupController.new.should respond_to(:set_callback)
    end

    it "should respond to add_device" do
      GroupController.new.should respond_to(:add_device)
    end
    it "should respond to remove_device" do
      GroupController.new.should respond_to(:remove_device)
    end
    it "should respond to delete" do
      GroupController.new.should respond_to(:delete)
    end

    it "should render a numeric group id on create" do
      put :create
      expect(response).to be_success 
      JSON.parse(response.body)['id'].should be_kind_of(Fixnum)
    end

  end

  describe "group create" do
    it "should render a numeric group id on create" do
      put :create
      expect(response).to be_success 
      JSON.parse(response.body)['id'].should be_kind_of(Fixnum)
    end
  end

  describe "group api responses " do
    before :each do
      @group_id = 1
      g = Group.find_or_create_by_id(@group_id)
    end


    it "should accept a callback" do
      put :set_callback, {:id => @group_id, :callback => "http://beacon.example.com/"}
      expect(response).to be_success 
    end

    it "should add a device" do
      put :add_device, {:id => @group_id, :uuid => "abcdid123"}
      expect(response).to be_success 
    end

    it "should remove a device" do
      put :remove_device, {:id => @group_id, :uuid => "abcdid123"}
      expect(response).to be_success 
    end

    it "should delete itself" do
      put :delete, {:id => @group_id}
      expect(response).to be_success 
      expect(Group.find_by_id(@group_id)).to be_nil
    end
  end
end
