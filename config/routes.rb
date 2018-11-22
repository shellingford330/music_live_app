Rails.application.routes.draw do
  get '/' => 'static_pages#home'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
end
