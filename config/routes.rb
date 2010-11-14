Store::Application.routes.draw do
  
  resources :baskets
  
  resources :items
  
  resources :line_items
  
  root :to => 'items#index'
  
end
