class  TransactionsController < ApplicationController
    before_action :authenticate_user!
    def index
      render json: Transaction.where(users: current_user)
    end
  
    def create
      transaction = Transaction.new(transaction_params)
      transaction.money_sent = transaction_params["money_received"] * transaction_params["rate"]
      transaction.beneficiary_id = Beneficiary.find(params[:beneficiary_id]).id
      transaction.users = [current_user, User.find(params[:user_id])]
      transaction.in_progress = true
      puts transaction
      if transaction.save
        render json: transaction, status: :created
      else
        byebug
        render json: transaction.errors, status: :unprocessable_entity
      end
    end
  
    def update
      transaction = Transaction.find(params[:id])
      transaction.finished = true
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
      params.require(:transaction).permit(:rate, :currency,
                                          :money_received, :money_sent)
    end
end  