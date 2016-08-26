Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#welcome"
  get "/teams", to: "teams#all", as: "team_all"
  get "/team/:id", to: "teams#show", as: "team_show"

  resources :matches
  
  namespace :admin do
    resources :weeks
    resources :matches

    get "/new_match", to: "match#create", as: "match_create"
    post "/log_session", to: "sessions#log", as: "sessions_log"
    get "/menu", to: "menu#index", as: "menu_index"
    root to: "sessions#loggin", as: "loggin"
  end
end
