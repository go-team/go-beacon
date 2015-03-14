require 'rails_helper'

RSpec.describe User, type: :model do

  describe "User creation" do
    it "should generate a admin and client key" do
      u = User.create()
      u.admin_key.length.should >= 10
      u.admin_key.length.should be_an_instance_of(String)

      u.client_key.length.should >= 10
      u.client_key.length.should be_an_instance_of(String)
    end
  end

end
