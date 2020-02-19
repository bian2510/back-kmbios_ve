class AddUserToBeneficiaries < ActiveRecord::Migration[6.0]
  def change
    add_reference :beneficiaries, :user, null: false, foreign_key: true
  end
end
