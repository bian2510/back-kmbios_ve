# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :transactions
  belongs_to :admin, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models # Fix error undefined method `devise'
  # for User (call 'User.connection' to establish a connection):Class
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
