require 'net/http'

class DeviceController < ApplicationController
  #before_action :auth_admin, :except => [:report_interaction]

  def register
    d = Device.find_by_uuid(params[:uuid])
    if d == nil
      d = Device.create!(:uuid => params[:uuid])
    end
    return render :json => {:uuid => d.uuid}
  end
  def report_interaction
    url = URI.parse('http://marcomontagna.com/set?name=rails')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, 3000) {|http|
      http.request(req)
    }

    d = Device.find_by_uuid!(params[:uuid])
    d.group.send_callback(params[:msg], params[:uuid])
    return render :json => {:success => 1}
  end

  def deregister
    d = Device.find_by_uuid(params[:uuid])
    if d != nil
      render :json => {:uuid => d.uuid}
      d.destroy!
      return 
    end
    return render :json => {:uuid => nil}
  end
end
