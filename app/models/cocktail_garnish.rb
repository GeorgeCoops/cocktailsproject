class CocktailGarnish < ApplicationRecord
  belongs_to :cocktail
  belongs_to :garnish
end
