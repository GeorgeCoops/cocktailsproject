class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.integer :calories
      t.string :instructions
      t.string :description
      t.string :difficulty
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
