# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name = %w[Carlos Fabian Abraham Juan Pedro Milagros Genesis Gleisy Pablo Hugo Omar Robert]
last_name = %w[Hernandez Fernandez Dios Eguez Bacigalupo Pedalino Arias Matos Pacheco Martinez Manelli]
bank = %w[Banesco Mercantil Provincial]

def create_beneficiary(name, last_name, bank)
  Beneficiary.create(name: name.sample, last_name: last_name.sample,
                     account_number: rand(100.1000), bank: bank.sample,
                     personal_id: rand(555..666), telephone_number: rand(222..333),
                     mobile_pay: rand(888..999))
end
10.times { create_beneficiary(name, last_name, bank) }
