class RenameRecipeCchefIdToChefId < ActiveRecord::Migration
  def change
    rename_column :recipes, :cchef_id, :chef_id
  end
end
