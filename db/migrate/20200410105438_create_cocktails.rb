class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.integer :calories
      t.text :instructions
      t.text :description
      t.string :difficulty
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
