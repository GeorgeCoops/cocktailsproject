class CocktailAlcohol < ApplicationRecord
  belongs_to :cocktail
  belongs_to :alcohol
end
