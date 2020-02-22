class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :beneficiary, null: false, foreign_key: true
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
