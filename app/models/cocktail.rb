class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :cocktail_alcohols
  has_many :cocktail_garnishes
  has_many :cocktail_mixers

  has_many :alcohols, through: :cocktail_alcohols 
  has_many :garnishes, through: :cocktail_garnishes
  has_many :mixers, through: :cocktail_mixers

  
end
