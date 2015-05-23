Rails.application.routes.draw do
  get '/scores', to: "scores#index"
  get '/scores/chart', to: "scores#chart_scores"

  post '/scores', to: "scores#create"

  root 'home#index'
  
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

  get '/logout', to: "sessions#destroy"

  get '/tweets', to: "home#tweets"

  get '/tweeted', to: "home#tweeted"

  get '/embed', to: "home#embed"
  
  scope :api, defaults: {format: :json} do
    get '/current-user', to: "users#show"
  end
end
