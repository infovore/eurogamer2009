ActionController::Routing::Routes.draw do |map|
  map.resources :reviews, :collection => {:unscored => :get}
  map.resources :writers
  map.resources :scores
  map.resources :pages, :collection => {:about => :get}
  
  map.about 'about', :controller => "pages", :action => "about"
  map.root :controller => "reviews"
end