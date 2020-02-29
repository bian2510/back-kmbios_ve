# frozen_string_literal: true

class MainController < ApplicationController
  def index
    beneficiaries = Beneficiary.all
    transactions = Transaction.all
    users = User.all
    response = { beneficiaries: beneficiaries, transactions: transactions,
                 users: users }
    render json: response, status: :ok
  end

  private

  def show_data_for_admin
    beneficiaries = Beneficiary.all
    transactions = Transaction.all
    users = User.all
    { beneficiaries: beneficiaries, transactions: transactions,
      users: users }
  end

  def show_data_for_user
    transactions = Transaction.all
    users = User.all
    { transactions: transactions, users: users }
    render json: response, status: :ok
  end
end
