class AddInProgressToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :in_progress, :boolean
  end
end
