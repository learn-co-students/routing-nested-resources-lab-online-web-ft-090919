# Rails.application.routes.draw do
#   resources :artists
#   resources :songs
# end

Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end
  resources :songs 
end
