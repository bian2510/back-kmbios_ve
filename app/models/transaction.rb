class Transaction < ApplicationRecord
  belongs_to :beneficiary
  belongs_to :admin
  belongs_to :users
end
