# frozen_string_literal: true

FactoryBot.define do
  bank = %w[banesco mercantil provincial venezuela tesoro exterior caroni
            plaza fondo_comun 100%banco bancrecer activo banplus bicentenario
            bnc bancaribe]

  factory :admin do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    password { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    password { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :random_beneficiary, class: Beneficiary do
    account_number { Faker::Number.between(from: 10_000_000_000_000_000_000, to: 99_999_999_999_999_999_999) }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    bank { bank.sample }
    personal_id { Faker::Number.between(from: 10_000_000, to: 99_999_999) }
    telephone_number { Faker::Number.between(from: 1_000_000_000_000, to: 1_000_000_000_000) }
    admin { build(:admin) }
  end
end
