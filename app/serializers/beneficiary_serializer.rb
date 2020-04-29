class BeneficiarySerializer < ActiveModel::Serializer
  attributes :id, :account_number, :name, :last_name, :bank, :personal_id,
             :telephone_number, :mobile_pay, :transactions

  def transactions
    object.transactions
  end
end
