RubyRailsSample::Application.routes.draw do
  root 'welcome#index'

    match 'device/register/:uuid/:admin_key', :to => 'device#register', :format => false, :as => :register_device, :via => [:put, :get]
    match 'device/deregister/:uuid/:admin_key', :to => 'device#deregister', :format => false, :as => :deregister_devise, :via => [:put, :get]

    match 'credentials/create', :to => 'user#create', :format => false, :as => :credentials_new, :via => [:post, :get]

end
