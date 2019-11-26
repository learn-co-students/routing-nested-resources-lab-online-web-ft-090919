Rails.application.routes.draw do
  resources :artists do 
    resources :songs, only: [:index, :show]
  end
  resources :songs
end

#for artist do song and then from there only do show and index 