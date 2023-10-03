Rails.application.routes.draw do
  devise_for :users
  get 'vehicle_histories/search'
  resources :parking_slots, only: [:index, :show] do
    member do
      post 'exit'
    end
  end

  resources :vehicle_histories, only: [] do
    collection do
      get 'search'
    end
  end


  get 'available_parking_slots/:entry_point', to: 'parking_slots#available_parking_slots', as: :available_parking_slots

  resources :vehicles, only: [:new, :create, :show]


  # get 'search_vehicle_histories', to: 'vehicle_histories#search', as: :search_vehicle_histories

  root 'vehicles#new'
  resources :vehicles do
    get 'new/:id', to: 'vehicles#new', on: :member, as: :new_with_id
  end

end
