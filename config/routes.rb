# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'user_auth'
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  # as :admin do
  #   # Define routes for Admin within this block.
  # end
  resources :beneficiaries, only: %i[index create update destroy]
  resources :transactions, only: %i[index create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
