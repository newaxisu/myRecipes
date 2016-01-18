class RemovePwdFromChef < ActiveRecord::Migration
  def change
    remove_column :chefs, :passwords_digest
  end
end
