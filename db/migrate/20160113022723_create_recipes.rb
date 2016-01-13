class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :summary
      t.text :description
      t.integer :cchef_id

      t.timestamps null: false
    end
  end
end
