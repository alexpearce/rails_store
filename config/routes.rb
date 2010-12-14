Store::Application.routes.draw do
  
  resources :baskets
  
  resources :items do
    resources :item_options
  end
  
  
  
  resources :line_items
  
  root :to => 'items#index'
  
end
