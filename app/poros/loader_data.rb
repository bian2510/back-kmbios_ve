# frozen_string_literal: true

class LoaderData
  def data_for_admin
    beneficiaries = Beneficiary.all
    transactions = Transaction.all
    users = User.all
    { beneficiaries: beneficiaries, transactions: transactions,
      users: users }
  end

  def data_for_user(current_user)
    transactions = Transaction.where(user_id: current_user.id)
    beneficiaries = Beneficiary.all
    admin = current_user.admin_id
    { transactions: transactions, beneficiaries: beneficiaries, admin: admin, users: [current_user] }
  end
end
