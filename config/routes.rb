Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/webhooks/sentry', to: 'tests#create'

  get '/error', to: 'tests#show'

  root 'tests#index'
end
