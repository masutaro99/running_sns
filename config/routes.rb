Rails.application.routes.draw do
  # get 'practices/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "practices#index"
  get  "presignedurl"  => "presignedurl#index"
  resources :imgs, only: %i[index show]
  resources :practices, only: %i[index show create update destroy]
end
