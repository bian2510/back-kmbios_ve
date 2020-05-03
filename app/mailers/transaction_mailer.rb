# frozen_string_literal: true

class TransactionMailer < ApplicationMailer
  def new_transaction_email(params)
    @transaction = params[:transaction]
    mail(to: 'bian251091@gmail.com', subject: 'Hay una nueva transaccion')
  end
end
