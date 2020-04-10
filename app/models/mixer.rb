class Mixer < ApplicationRecord
    has_many :cocktail_mixers
    has_many :cocktails, through: :cocktail_mixer
    has_many :users, through: :mixers
end
