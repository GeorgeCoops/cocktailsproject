class Cocktail < ApplicationRecord
  belongs_to :user 
  has_many :cocktail_alcohols, dependent: :destroy
  has_many :cocktail_garnishes, dependent: :destroy
  has_many :cocktail_mixers, dependent: :destroy

  has_many :alcohols, through: :cocktail_alcohols 
  has_many :garnishes, through: :cocktail_garnishes
  has_many :mixers, through: :cocktail_mixers

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
  validates :name, length: { maximum: 20 }
  validates :difficulty, inclusion: { in: %w(easy medium hard Easy Medium Hard), 
  message: ": For difficulty, easy medium or hard must be selected." }
  validates :calories, inclusion: { in: (0..1000)}



  def garnishes_attributes=(garnish_attributes)
    garnish_attributes.values.each do |garnish_attribute|
        if garnish_attribute["name"].present?
        garnish = Garnish.find_or_create_by(garnish_attribute)
        self.garnishes << garnish
      end
    end
  end


  def mixers_attributes=(mixer_attributes)
    mixer_attributes.values.each do |mixer_attribute|
      if mixer_attribute["name"].present?
      mixer = Mixer.find_or_create_by(mixer_attribute)
      self.mixers << mixer
      end
    end
  end

  def alcohols_attributes=(alcohol_attributes)
    alcohol_attributes.values.each do |alcohol_attribute|
      if alcohol_attribute["name"].present?
      alcohol = Alcohol.find_or_create_by(alcohol_attribute)
      self.alcohols << alcohol
      end
    end
  end

  def user_name=(name)
    self.user = User.find_or_create_by(name: name)
  end

  def user_name
     self.user ? self.user.name : nil
  end

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
