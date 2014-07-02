Cfb::Application.routes.draw do
  devise_for :users
  resources :teams do
    resources :profiles
  end
  resources :spreads, :only => [:create, :update]

  get '/weeks/:week_number', to: 'games#week'
  get "/pr", to: "profiles#pr"
  get "/hfa", to: "profiles#hfa"
  get "/about", to: "teams#about"
  root to: "teams#index"
end
