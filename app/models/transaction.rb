# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :beneficiary
  belongs_to :admin
  belongs_to :user
  has_one_attached :voucher
end
