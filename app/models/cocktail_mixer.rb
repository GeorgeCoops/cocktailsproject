class CocktailMixer < ApplicationRecord
  belongs_to :cocktail
  belongs_to :mixer
end
