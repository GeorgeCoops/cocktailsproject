class CreateCocktailAlcohols < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_alcohols do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.references :alcohol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
