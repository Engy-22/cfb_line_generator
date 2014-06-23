Cfb::Application.routes.draw do
  devise_for :users
  resources :teams do
    resources :profiles
  end
  resources :games
  resources :spreads, :only => [:create, :update]
  get "/pr", to: "profiles#pr"
  patch "/pr", to: "profile#pr_update"
  get "/hfa", to: "profiles#hfa"
  put "/hfa", to: "profile#hfa_update"
  root to: "teams#index"
end
