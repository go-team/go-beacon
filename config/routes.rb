RubyRailsSample::Application.routes.draw do
  root 'welcome#index'

  match 'device/register/:uuid/:admin_key', :to => 'device#register', :format => false, :as => :register_device, :via => [:put, :get]
  match 'device/deregister/:uuid/:admin_key', :to => 'device#deregister', :format => false, :as => :deregister_device, :via => [:put, :get]

  match 'device/report_interaction/:uuid/', :to => 'device#report_interaction', :format => false, :as => :interact_device, :via => [:put, :get]

  match '/group/create' => 'group#create', :via => [:put, :get]
  match '/group/:id/set_callback' => 'group#set_callback', :via => [:put, :get]
  match '/group/add_device' => 'group#add_device', :via => [:put, :get]

  match '/group/:id/add_device/:uuid' => 'group#add_device', :via => [:put, :get]
  match '/group/:id/remove_device/:uuid' => 'group#remove_device', :via => [:put, :get]


  match '/group/remove_device' => 'group#remove_device', :via => [:put, :get]
  match '/group/delete' => 'group#delete', :via => [:put, :get]


  match 'credentials/create', :to => 'user#create', :format => false, :as => :credentials_new, :via => [:post, :get]

end
