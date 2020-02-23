class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :beneficiary, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rate
      t.string :currency
      t.integer :money_received
      t.integer :money_sent
      t.boolean :in_progress
      t.boolean :finished

      t.timestamps
    end
  end
end
