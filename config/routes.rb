# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers: {
    sessions: 'overrides/sessions'
  }
  # as :admin do
  #   # Define routes for Admin within this block.
  # end
  resources :beneficiaries, only: %i[index show create update destroy]
  resources :transactions, only: %i[index show create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
