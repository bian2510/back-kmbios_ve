class AddFinishedToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :finished, :boolean
  end
end
