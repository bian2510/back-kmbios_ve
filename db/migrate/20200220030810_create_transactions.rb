class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :beneficiary, foreign_key: true
      t.integer :rate
      t.string :currency
      t.integer :money_received
      t.integer :money_sent

      t.timestamps
    end
  end
end
