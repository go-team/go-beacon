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
  end

  describe "create" do
    it "should render a numeric group id on create" do
      put :create
      expect(response).to be_success 
      JSON.parse(response.body)['id'].should be_kind_of(Fixnum)
    end
    it "should create a new group" do
      pre_count = Group.all.count
      put :create
      curr_count = Group.all.count
      pre_count.should eq(curr_count - 1)
    end
  end

  describe "group api responses " do
    before :each do
      @group = Group.create()
    end

    describe "set_callback " do
      before :each do
        @callback_url = "http://beacon.example.com/"
        put :set_callback, {:id => @group.id, :callback => @callback_url}
      end
      it "should send good response" do
        expect(response).to be_success 
      end
      it "should set callback correctly " do
        @group.callback_url.should eq(@callback_url)
      end
    end

    describe "add_device " do
      before :each do
        @uuid = "abcdid123"
        put :add_device, {:id => @group.id, :uuid => @uuid}
      end
      it "should send good response" do
        expect(response).to be_success 
      end
      it "should sets callback correctly " do
        @group.devices.include?(Device.find_by_uuid(@uuid)).should be_truthy
      end
    end

    describe "remove_device " do
      before :each do
        @uuid = "abcdid123"
        put :add_device, {:id => @group.id, :uuid => @uuid}
        put :remove_device, {:id => @group.id, :uuid => @uuid}
      end
      it "should send good response" do
        expect(response).to be_success 
      end
      it "should sets callback correctly " do
        @group.devices.include?(Device.find_by_uuid(@uuid)).should be_falsey
      end
    end

    describe "delete " do
      before :each do
        put :delete, {:id => @group.id}
      end
      it "should send good response " do
        expect(response).to be_success 
      end
      it "should delete itself " do
        expect(Group.find_by_id(@group.id)).to be_nil
      end
    end

  end
end
