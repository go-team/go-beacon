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

    it "should allow finding by bluetooth_id" do
      d = Device.create!(:uuid => "abc_id")
      dd = Device.find_by_uuid!("abc_id")
    end

end
