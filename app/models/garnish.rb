class Garnish < ApplicationRecord
    has_many :cocktail_garnishes
    has_many :cocktails, through: :cocktail_garnishes
    has_many :users, through: :cocktails

    validates :name, uniqueness: true
    # validates :name, format: { with: /\A[a-zA-Z]+\z/,
    # message: "only allows letters" }
    # need to add spaces into that
    validates :name, presence: true 
    
end
