# frozen_string_literal: true

class TransactionsController < ApplicationController
  devise_token_auth_group :member, contains: %i[user admin]
  #before_action :authenticate_member!, only: %i[index update]
  #before_action :authenticate_admin!, only: %i[create destroy]

  def index
    render json: Transaction.all
  end

  def create
    transaction = Transaction.new(transaction_params)
    transaction.admin_id = current_admin.id
    if transaction.save
      TransactionMailer.new_transaction_email(transaction: Transaction.first).deliver
      render json: transaction, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    transaction = Transaction.find(params[:id])
    if transaction.save
      render json: transaction, status: :ok
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    if transaction.destroy
      render json: transaction, status: :ok
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:id, :rate, :currency,
                                        :money_received, :money_sent,
                                        :beneficiary_id, :user_id,
                                        :in_progress, :finished,
                                        :money_sent)
  end
end
