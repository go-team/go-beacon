require 'securerandom'

class User < ActiveRecord::Base
  has_many :groups
  has_many :devices
  after_initialize :init

  def init
    self.admin_key  ||= SecureRandom.hex(20)
    self.client_key ||= SecureRandom.hex(20)
  end

end
