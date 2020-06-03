# frozen_string_literal: true

class BeneficiarySerializer < ActiveModel::Serializer
  attributes :id, :account_number, :name, :last_name, :bank, :personal_id,
             :telephone_number, :mobile_pay, :transactions, :admin, :users

  def transactions
    object.transactions
  end

  def admin
    object.admin
  end

  def users
    object.admin.users
  end
end
