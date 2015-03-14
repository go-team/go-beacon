require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "Group callbacks" do
    it "should set a callback for all devices" do
      g = Group.create(:callback_url => "http://example.com/")
      d = g.devices.build(:bluetooth_id)
      d.callback_url.should == "http://example.com/"
    end
  end

  describe "Adding and removing beacons" do
    it "should add a beacon" do
      g = Group.create(:callback_url => "http://example.com/")
      d = Device.create(:bluetooth_id)
      g.devices << d
      g.save
      gg = Group.find(g.id)
      gg.devices.should include(d)
    end

    it "should removing a beacon" do
      g = Group.create(:callback_url => "http://example.com/")
      d = g.devices.build(:bluetooth_id)
      d.group_id = nil
      g.save
      d.save
      gg = Group.find(g.id)
      gg.devices.should_not include(d)
    end
  end


end
