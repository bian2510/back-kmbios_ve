class Transaction < ApplicationRecord
  belongs_to :beneficiary
  has_many :users
end
