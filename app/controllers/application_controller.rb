class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def client_key
      user = User.find_by_client_key (params[:client_key])
      if user == nil
       return render :text => "401", :status => :unauthorized
      end
  end
  
  def auth_admin
      user = User.find_by_admin_key (params[:admin_key])
      if user == nil
       return render :text => "401", :status => :unauthorized
      end
  end
end
