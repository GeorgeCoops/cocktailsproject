class Mixer < ApplicationRecord
    has_many :cocktail_mixers
    has_many :cocktails, through: :cocktail_mixers
    has_many :users, through: :mixers

    validates :name, presence: true 
    validates :name, length: { maximum: 20 }
    # validates :name, format: { with: /\A[a-zA-Z]+\z/,
    # message: "only allows letters" } # need to add inclusion of spaces
    validates :sweet_sour, presence: true 
    validates :name, uniqueness: true
end

