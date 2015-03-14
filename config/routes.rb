RubyRailsSample::Application.routes.draw do
  root 'welcome#index'

    match 'device/register/:uuid', :to => 'device#register', :format => false, :as => :register_device, :via => [:put]
    match 'device/deregister/:uuid', :to => 'device#deregister', :format => false, :as => :deregister_devise, :via => [:put]

    match 'credentials/create', :to => 'user#create', :format => false, :as => :credentials_new, :via => [:post]

end
