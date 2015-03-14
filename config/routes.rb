RubyRailsSample::Application.routes.draw do
  root 'welcome#index'

  resources :group
  put '/group/create' => 'group#create'
  put '/group/set_callback' => 'group#set_callback'
  put '/group/add_device' => 'group#add_device'
  put '/group/remove_device' => 'group#remove_device'
  put '/group/delete' => 'group#delete'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  match 'device/register/:uuid', :to => 'device#register', :format => false, :as => :register_device, :via => [:put]
  match 'device/deregister/:uuid', :to => 'device#deregister', :format => false, :as => :deregister_devise, :via => [:put]


end
