class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :beneficiary, :user, :rate, :currency, :money_received,
             :money_sent, :in_progress, :finished, :created_at, :updated_at,
             :admin

  def beneficiary
    object.beneficiary
  end

  def user
    object.user
  end

  def admin
    object.admin
  end
end
