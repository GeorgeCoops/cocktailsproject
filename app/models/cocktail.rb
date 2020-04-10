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
  validates :difficulty, inclusion: { in: %w(easy medium hard), 
  message: "%{value} is not a valid choice."}
  validates :calories, inclusion: { in: %w(0..1000)}

end
