Cfb::Application.routes.draw do
  devise_for :users
  resources :teams do
    resources :profiles
  end
  resources :spreads, :only => [:create, :update]
  get "/pr", to: "profiles#pr"
  get "/hfa", to: "profiles#hfa"
  get "/about", to: "teams#about"
  get "/wk1", to: "games#wk1"
  get "/wk2", to: "games#wk2"
  get "/wk3", to: "games#wk3"
  get "/wk4", to: "games#wk4"
  get "/wk5", to: "games#wk5"
  get "/wk6", to: "games#wk6"
  get "/wk7", to: "games#wk7"
  get "/wk8", to: "games#wk8"
  get "/wk9", to: "games#wk9"
  get "/wk10", to: "games#wk10"
  get "/wk11", to: "games#wk11"
  get "/wk12", to: "games#wk12"
  get "/wk13", to: "games#wk13"
  get "/wk14", to: "games#wk14"
  get "/wk15", to: "games#wk15"
  root to: "teams#index"
end
