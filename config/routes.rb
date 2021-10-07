Rails.application.routes.draw do
  resources :courses, only: [:index, :show, :create, :update, :destroy] do
  resources :tutors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
