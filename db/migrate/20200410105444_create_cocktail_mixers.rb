class CreateCocktailMixers < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_mixers do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.references :mixer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
