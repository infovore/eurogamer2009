ActionController::Routing::Routes.draw do |map|
  map.resources :reviews
  map.resources :writers
  map.resources :scores
  
  map.root :controller => "reviews", :action => "index"
end