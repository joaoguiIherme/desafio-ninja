Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :schedulings, only: %i[index show update destroy]
      resources :rooms, only: %i[index show] do
        resources :schedulings, only: %i[create]
      end
    end
  end
end
