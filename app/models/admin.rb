# frozen_string_literal: true

class Admin < ActiveRecord::Base
  has_many :users
  has_many :transactions
  has_many :beneficiaries
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models # Fix error undefined method `devise'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
