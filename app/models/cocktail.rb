class Cocktail < ApplicationRecord
  belongs_to :user 
  has_many :cocktail_alcohols
  has_many :cocktail_garnishes
  has_many :cocktail_mixers

  has_many :alcohols, through: :cocktail_alcohols 
  has_many :garnishes, through: :cocktail_garnishes
  has_many :mixers, through: :cocktail_mixers

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id 
  validates :name, length: { maximum: 20 }
  validates :difficulty, inclusion: { in: %w(easy medium hard), 
  message: "%{value} is not a valid choice."}
  validates :calories, inclusion: { in: (0..1000)}

  def similar_cocktails
    Cocktail.all.map do |cock|
      a = cock.alcohols.to_a
      b = self.alcohols.to_a

        a.each do |cocktail|
          if a.include?(b.each)
            return cocktail.name
        end 
      
    end
  end
  end

end
