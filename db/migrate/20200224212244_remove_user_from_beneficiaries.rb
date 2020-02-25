# frozen_string_literal: true

class RemoveUserFromBeneficiaries < ActiveRecord::Migration[6.0]
  def change
    remove_reference :beneficiaries, :user, null: false, foreign_key: true
  end
end
