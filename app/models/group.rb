require 'net/http'

class Group < ActiveRecord::Base
  belongs_to :user
  has_many :devices

  def send_callback(msg, uuid) 
    uri = URI(self.callback_url)
    params = { :msg => msg, :reporter_uuid => uuid}
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end
end
