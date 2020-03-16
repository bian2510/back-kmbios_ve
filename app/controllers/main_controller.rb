# frozen_string_literal: true

class MainController < ApplicationController
  devise_token_auth_group :member, contains: %i[user admin]
  before_action :authenticate_member!, only: [:index]

  def index
    return show_data_for_admin if admin_signed_in?
    return show_data_for_user if user_signed_in?
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
    admin = current_user.admin
    render json: { transactions: transactions, admin: admin }, status: :ok
  end

  def params_login
    params.require(:main).permit(:email, :password)
  end
end
