require 'rails_helper'

RSpec.describe DeviceController, type: :controller do

  describe "expected DeviceController actions " do
    it "should respond to register" do
      DeviceController.should respond_to(:register)
    end
    it "should respond to deregister" do
      DeviceController.should respond_to(:deregister)
    end
  end



  describe "registration" do
    it "should succesfully register a device" do
      put :register, {:bluetooth_id => "abcblueid123" }
      expect(response).to be_success

    end
    it "should succesfully deregister a device" do
      d = Device.create(:bluetooth_id => "abcblueid123")
      put :register, {:bluetooth_id => d.bluetooth_id }
      expect(response).to be_success
    end
  end
end
