class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :chef_id
      t.text :review
      t.integer :recipe_id
      t.string :headline

      t.timestamps null: false
    end
  end
end
