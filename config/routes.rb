Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :listings
  resources :categories
  resources :users do
    member do
      get 'listing'
    end
  end

  get 'search',to: "listings#search"
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get 'alert' => 'messages#alert'
  get 'offer' => 'messages#offer'

end
