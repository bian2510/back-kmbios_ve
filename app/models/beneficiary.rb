class Beneficiary < ApplicationRecord
  has_many :transactions
  belongs_to :admin
  validates :account_number, length: { in: 20..20 }, uniqueness: true
  validates :name, :last_name, :account_number, :bank, :personal_id,
            :telephone_number, presence: true
  validates :bank, inclusion: { in: %w[banesco mercantil provincial
                                       venezuela tesoro exterior caroni
                                       plaza fondo_comun 100%banco bancrecer
                                       activo banplus bicentenario bnc 
                                       bancaribe] }
end
