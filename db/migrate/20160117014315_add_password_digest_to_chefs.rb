class AddPasswordDigestToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :passwords_digest, :string
  end
end
