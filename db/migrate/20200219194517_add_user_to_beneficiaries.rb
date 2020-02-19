class AddUserToBeneficiaries < ActiveRecord::Migration[6.0]
  def change
    add_reference :beneficiaries, :user, foreign_key: true
  end
end
