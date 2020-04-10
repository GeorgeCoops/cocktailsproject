class Mixer < ApplicationRecord
    has_many :cocktail_mixers
    has_many :cocktails, through: :cocktail_mixer
    has_many :users, through: :mixers

    validates :name, presence: true 
    validates :name, length: { maximum: 20 }
    validates :colour, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :sweet_sour, presence: true 
    validates :sweet_sour, inclusion: { in: %w(sweet sour), 
    message: "%{value} is not a valid choice."}
end

