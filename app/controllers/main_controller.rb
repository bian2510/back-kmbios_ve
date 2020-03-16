# frozen_string_literal: true

class MainController < ApplicationController
  devise_token_auth_group :member, contains: %i[user admin]
  before_action :authenticate_member!, only: [:index]

  def index
    if admin_signed_in?
      show_data_for_admin
    else
      show_data_for_user
    end
  end

  private

  def show_data_for_admin
    beneficiaries = Beneficiary.all
    transactions = Transaction.all
    users = User.all
    render json: { beneficiaries: beneficiaries,
                   transactions: transactions,
                   users: users }, status: :ok
  end

  def show_data_for_user
    transactions = Transaction.all
    users = User.all
    render json: { transactions: transactions, users: users }, status: :ok
  end
end
