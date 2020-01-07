Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'beneficiaries#index'
  resource :beneficiary, only: %i[index create update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
