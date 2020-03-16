# frozen_string_literal: true

class AddAdminIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :admin, foreign_key: true
  end
end
