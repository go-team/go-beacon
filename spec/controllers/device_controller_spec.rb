require 'rails_helper'

RSpec.describe DeviceController, type: :controller do
  describe "expected DeviceController actions " do
    it "should respond to register" do
      expect(DeviceController.new).to respond_to(:register)
    end
    it "should respond to deregister" do
      expect(DeviceController.new).to respond_to(:deregister)
    end
  end

  describe "registration with auth" do
    before(:each) do
      @user = User.create
     end
    it "should succesfully register a device" do
      put :register, {:uuid => "abcblueid123" , :admin_key => @user .admin_key}
      expect(response).to be_success
      result = JSON.parse(response.body)
      expect(result).to include('uuid')
      expect(result['uuid']).to eq "abcblueid123"
      expect(Device.find_by_uuid("abcblueid123")).not_to be nil

    end
    it "should succesfully deregister a device" do
      d = Device.create(:uuid => "abcblueid123")
      put :deregister, {:uuid => d.uuid , :admin_key => @user .admin_key}
      expect(response).to be_success
      result = JSON.parse(response.body)
      expect(result).to include('uuid')
      expect(result['uuid']).to eq "abcblueid123"
    end

    it "should return uuid nil if trying to register a nonextant device" do
      put :deregister, {:uuid => "woodles" , :admin_key => @user .admin_key}
      expect(response).to be_success
      result = JSON.parse(response.body)
      expect(result).to include('uuid')
      expect(result[:uuid]).to be_nil
    end
  end

  describe "registration without auth" do

    it "should succesfully register a device" do
      put :register, {:uuid => "abcblueid123" , :admin_key => ''}
      expect(response.code).to eq("401")
    end
    it "should succesfully deregister a device" do
      d = Device.create(:uuid => "abcblueid123")
      put :deregister, {:uuid => d.uuid , :admin_key => ''}
      expect(response.code).to eq("401")
    end


  end
end
