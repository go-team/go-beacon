require 'rails_helper'

RSpec.describe Device, type: :model do


  describe "Device (de)?registration" do
    it "should allow creation" do
      d = Device.create!(:uuid => "abc_id")
    end
    it "should allow deletion" do
      d = Device.create!(:uuid => "abc_id")
      dd = Device.find(d.id).destroy!
    end
  end

  describe "Interaction reporting" do
    it "should respond to report_interaction" do
          expect(Device.create!(:uuid => "abc_id")).to respond_to(:report_interaction)
    end

    it "interactions should trigger a callback" do
        g = Group.create(:callback_url => "http://example.com/")
       # expect(GroupController).to receive(:send_callback)
        d = g.devices.create(:uuid => "abc_id")
        d.report_interaction(:msg => {:data => 123})
    end

  end

    it "should allow finding by bluetooth_id" do
      d = Device.create!(:uuid => "abc_id")
      dd = Device.find_by_uuid!("abc_id")
    end

end
