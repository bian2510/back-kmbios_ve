# frozen_string_literal: true

class RemoveTransactionFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :transaction, null: false, foreign_key: true
  end
end
