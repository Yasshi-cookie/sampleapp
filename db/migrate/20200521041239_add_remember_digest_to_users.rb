# frozen_string_literal: true

class AddRememberDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remember_digest, :string, null: false, default: ''
  end
end
