Rails.application.routes.draw do
  get '/' => 'static_pages#home'

  post '/signup' => 'users#create'

end
