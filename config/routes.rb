Rails.application.routes.draw do
  get 'tests/results/:id', to: 'results#test_results'
  get 'users/results/:id', to: 'results#user_results'
  resources :results, except: :edit

  devise_for :users,
             # path: '',
             # path_names: {
             #   sign_in: 'login',
             #   sign_out: 'logout',
             #   registration: 'signup'
             # },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :questions
  resources :tests
  resources :courses
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
