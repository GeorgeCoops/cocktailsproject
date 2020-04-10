class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end



# rails g model User name:string age:integer favourite_cocktail:string location:string active:boolean 

# rails g model Cocktail name:string calories:integer instructions:text description:text difficulty:string user:references 


# rails g model CocktailMixer cocktail:references mixer:references

# rails g model Mixer name:string sweet_sour:string  


# rails g model CocktailAlcohol cocktail:references alcohol:references

# rails g model Alcohol name:string colour:string alcohol_content:integer 


# rails g model CocktailGarnish cocktail:references garnish:references

# rails g model Garnish name:string edible:boolean


# rails g controller users 

# rails g controller cocktails

# rails g controller alcohols

# rails g controller mixers

# rails g controller ingredients

