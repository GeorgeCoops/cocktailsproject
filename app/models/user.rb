class User < ApplicationRecord
    has_many :cocktails
    has_many :mixers, through: :cocktails
    has_many :garnishes, through: :cocktails
    has_many :alcohols, through: :cocktails

    validates :name, presence: true 
    validates :name, length: { maximum: 20 }
    # validates :name, format: { with: /\A[a-zA-Z]+\z/,
    # message: "only allows letters" }
    validates :location, length: { maximum: 20 }
    # validates :location, format: { with: /\A[a-zA-Z]+\z/,
    # message: "only allows letters" }
    validates :age, inclusion: { in: (18..100) }
    validates :name, uniqueness: true
end


