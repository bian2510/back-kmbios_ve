class  TransactionsController < ApplicationController
    before_action :authenticate_user!
    def index
      render json: Transaction.where(user_id: current_user.id)
    end
  
    def create
      transaction = Transaction.new(transaction_params)
      transaction.user_id = current_user.id
      transaction.in_progress
      if transaction.save
        render json: transaction, status: :created
      else
        render json: transaction.errors, status: :unprocessable_entity
      end
    end
  
    def update
      transaction = Transaction.find(params[:id])
      if transaction.update(transaction_params)
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
      params.require(:transaction).permit(:beneficiary_id, :rate, :currency,
                                          :money_received, :money_sent)
    end
  end
end  