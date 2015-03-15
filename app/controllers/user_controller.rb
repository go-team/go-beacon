class UserController < ApplicationController
  def create
    u = User.create
    render :json => {:admin_key => u.admin_key,:client_key => u.client_key}
  end
end
