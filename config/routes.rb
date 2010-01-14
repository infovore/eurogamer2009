ActionController::Routing::Routes.draw do |map|
  map.resources :reviews, :collection => {:unscored => :get}
  map.resources :writers
  map.resources :scores
  map.resources :pages, :collection => {:about => :get}
  
  map.root :controller => "reviews" #, :action => "index"
  # map.root :controller => "home", :action => "show"
end