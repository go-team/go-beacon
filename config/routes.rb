RubyRailsSample::Application.routes.draw do
  root 'welcome#index'

    match 'device/register/:uuid/:admin_key', :to => 'device#register', :format => false, :as => :register_device, :via => [:put]
    match 'device/deregister/:uuid/:admin_key', :to => 'device#deregister', :format => false, :as => :deregister_devise, :via => [:put]

    match 'credentials/create', :to => 'user#create', :format => false, :as => :credentials_new, :via => [:post]

end
