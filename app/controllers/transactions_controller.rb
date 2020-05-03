# frozen_string_literal: true

class TransactionsController < ApplicationController
  devise_token_auth_group :member, contains: %i[user admin]
  before_action :authenticate_member!, only: %i[index show update]
  before_action :authenticate_admin!, only: %i[create destroy]

  def index
    if user_signed_in?
      render json: Transaction.where(user_id: current_member.id), status: :ok
    else
      render json: Transaction.where(admin_id: current_member.id), status: :ok
    end
  end

  def show
    render json: Transaction.find(params[:id]), status: :ok
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
    if user_signed_in? && transaction.user_id == current_member.id
      update_transaction(transaction)
    elsif admin_signed_in? && transaction.admin_id == current_member.id
      update_transaction(transaction)
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    if transaction.destroy
      render json: Transaction.all, status: :ok
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def update_transaction(transaction)
    if transaction.update(update_transaction_params)
      render json: transaction, status: :ok
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  def transaction_params
    params.require(:transaction).permit(:rate, :currency,
                                        :money_received, :money_sent,
                                        :beneficiary_id, :user_id,
                                        :in_progress)
  end

  def update_transaction_params
    params.require(:transaction).permit(:finished)
  end
end
