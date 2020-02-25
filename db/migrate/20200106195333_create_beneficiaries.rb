# frozen_string_literal: true

class CreateBeneficiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :beneficiaries do |t|
      t.string :account_number, unique: true
      t.string :name
      t.string :last_name
      t.string :bank
      t.integer :personal_id
      t.integer :telephone_number
      t.integer :mobile_pay

      t.timestamps
    end
  end
end
