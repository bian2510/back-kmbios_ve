class Beneficiary < ApplicationRecord
  validates :account_number, length: { in: 20..20 }
  validates :name, :last_name, :account_number, :bank, :personal_id,
            :telephone_number, presence: true
  validates :bank, inclusion: { in: %w[banesco mercantil provincial
                                       venezuela tesoro exterior caroni
                                       plaza fondo_comun 100%_banco bancrecer
                                       banco_activo banplus bicentenario bnc] }
end
