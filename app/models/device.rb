class Device < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  def report_interaction(msg)
    self.group.send_callback(msg)
  end
end
