ActionController::Routing::Routes.draw do |map|
  map.resources :newsletters
  
  map.namespace :admin do |admin|
    admin.resources :newsletters
  end
end