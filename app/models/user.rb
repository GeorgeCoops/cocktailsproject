class User < ApplicationRecord
    has_many :cocktails
    has_many :mixers, through: :cocktails
    has_many :garnishes, through: :cocktails
    has_many :alcohols, through: :cocktails
end
