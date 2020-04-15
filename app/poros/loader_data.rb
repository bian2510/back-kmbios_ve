class LoaderData
  def data_for_admin
    beneficiaries = Beneficiary.all
    transactions = Transaction.all
    users = User.all
    { beneficiaries: beneficiaries, transactions: transactions,
      users: users }
  end

  def data_for_user
    transactions = Transaction.all
    admin = current_user.admin
    { transactions: transactions, admin: admin }
  end
end
