ActionController::Routing::Routes.draw do |map|
  map.resources :reviews, :collection => {:unscored => :get}
  map.resources :writers
  map.resources :scores
  map.resource :home
  
  map.root :controller => "home", :action => "show"
end