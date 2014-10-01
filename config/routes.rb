Rails.application.routes.draw do
  root 'todos#index'
  resources :todos do
    post 'complete', on: :member
  end
end
