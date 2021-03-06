# frozen_string_literal: true

class AddAdminIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :admin, foreign_key: true
  end
end
