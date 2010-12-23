Store::Application.routes.draw do
  
  devise_for :admins

  resources :baskets do
    resources :line_items
  end
  
  resources :items do
    resources :item_options
  end
  
  root :to => 'items#index'
  
end
