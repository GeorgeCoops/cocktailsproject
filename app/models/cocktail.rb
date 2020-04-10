class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :cocktail_alcohols
  has_many :cocktail_garnishs
  has_many :cocktail_mixers

  has_many :alcohols, through: :cocktail_alcohols 
  has_many :garnishs, through: :cocktail_garnishs
  has_many :mixers, through: :cocktail_mixers 
end
