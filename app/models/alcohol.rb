class Alcohol < ApplicationRecord
    has_many :cocktail_alcohols
    has_many :cocktails, through: :cocktail_alcohol
    has_many :users, through: :cocktails

    
end
