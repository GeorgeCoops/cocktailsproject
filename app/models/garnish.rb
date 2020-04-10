class Garnish < ApplicationRecord
    has_many :cocktail_garnishs
    has_many :cocktails, through: :cocktail_garnish
    has_many :users, through: :cocktails
end
