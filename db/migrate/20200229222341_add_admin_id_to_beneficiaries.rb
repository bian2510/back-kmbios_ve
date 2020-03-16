# frozen_string_literal: true

class AddAdminIdToBeneficiaries < ActiveRecord::Migration[6.0]
  def change
    add_reference :beneficiaries, :admin, foreign_key: true
  end
end
