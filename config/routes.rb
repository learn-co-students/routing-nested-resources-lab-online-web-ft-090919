Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: %i[index show]
  end
  resources :songs
end
