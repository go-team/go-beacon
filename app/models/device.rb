class Device < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  attr_accessor :bluetooth_id
end
