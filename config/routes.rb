ActionController::Routing::Routes.draw do |map|
  map.resources :reviews, :collection => {:unscored => :get}
  map.resources :writers
  map.resources :scores
  
  map.root :controller => "reviews", :action => "index"
end