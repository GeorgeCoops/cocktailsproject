class CreateCocktailGarnishes < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_garnishes do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.references :garnish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
