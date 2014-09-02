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
  get "/win_totals", to: "spreads#win_totals"
  get "/push", to: "historicals#push"
  get "/spread_to_ml", to: "historicals#spread_to_ml"
  root to: "teams#index"
end
