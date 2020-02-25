# frozen_string_literal: true

class AddTransactionIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :transaction, foreign_key: true
  end
end
