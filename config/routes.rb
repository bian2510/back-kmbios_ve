Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', :skip => [:registrations]
  root 'beneficiaries#index'
  resources :beneficiaries, only: %i[index create update destroy]
  resources :transactions, only: %i[index create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
