class ChangeIntegerLimitInBeneficiaries < ActiveRecord::Migration[6.0]
  def change
    change_column :beneficiaries, :telephone_number, :integer, limit: 8
    change_column :beneficiaries, :mobile_pay, :integer, limit: 8
    change_column :beneficiaries, :personal_id, :integer, limit: 8
  end
end
