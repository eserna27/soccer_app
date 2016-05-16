Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/teams", to: "teams#all", as: "team_all"
  get "/team/:id", to: "teams#show", as: "team_show"
end
