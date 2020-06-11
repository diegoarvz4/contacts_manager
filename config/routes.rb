Rails.application.routes.draw do

  get 'contact_files/index'
  authenticated :user do
    root to: 'pages#home'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end


  devise_for :users
  get '/contacts/handle', to: 'contacts#handle'
  post '/contacts/create', to: 'contacts#upload'
  resources :contacts, only: %i[index new create] do 
    collection { post :import }
  end

  resources :contact_files, only: %i[index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
