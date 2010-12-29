Store::Application.routes.draw do
  
  resources :pages

  resources :categories

  devise_for :admins

  resources :baskets do
    resources :line_items
  end
  
  resources :items do
    collection do
      post 'search'
    end
    resources :item_options
  end
  
  root :to => 'items#index'
  
end
