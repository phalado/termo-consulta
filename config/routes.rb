Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :words, only: :create do
        get :locate, on: :collection
      end

      resources :month_tests do
        get :parse_month, on: :collection
      end
    end
  end
end
