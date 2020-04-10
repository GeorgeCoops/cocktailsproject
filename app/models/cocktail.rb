class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :cocktail_alcohols
  has_many :cocktail_garnishes
  has_many :cocktail_mixers

  has_many :alcohols, through: :cocktail_alcohols 
  has_many :garnishes, through: :cocktail_garnishes
  has_many :mixers, through: :cocktail_mixers

  validates :name, presence: true 
  validates :name, length: { maximum: 20 }
  validates :colour, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }
  validates :sweet_sour, presence: true 
  validates :sweet_sour, inclusion: { in: %w(sweet sour), 
  message: "%{value} is not a valid choice."}
end
