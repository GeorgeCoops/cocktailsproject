class Garnish < ApplicationRecord
    has_many :cocktail_garnishes
    has_many :cocktails, through: :cocktail_garnish
    has_many :users, through: :cocktails

    validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :name, presence: true 
    
end
