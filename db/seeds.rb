# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Alohol
alcohol_name = ["Gin", "Vodka", "Whiskey", "Sambuca", "Schnapps", "Absinthe", "Ouzo", "White Rum", "Dark Rum" ]
alcohol_colour = ["Light", "Medium", "Dark"]

#Cocktails
cocktail_names = ["White Russian", "Porn Star Martini", "Mojito", "Dark and Stormy", "Mosco Mules", "Sex on the Beach", "Negroni"]
#calories 
cocktail_instructions = ["Mash lime, stir, add crushed ice.", "Put ice in glass, add ingredients.", "Put in cocktail shaker, shake, strain into glass with ice."]
cocktail_descriptions = [ "Blend pink gin with iced tea and you have this unique cocktail, made with spiced rum, elderflower and pink grapefruit. Serve in a jug for a sharing cocktail", "Our tropical, rum-based hurricane cocktail is easy to make and sure to get your party started. Garnish with orange and cocktail cherries for a kitsch touch", "Make an easy vodka martini with our simple recipe for an elegant party tipple. Serve your cool cocktail with an olive or a twist of lemon peel", "Sip our refreshing blueberry mojito when the sun starts to shine. This easy cocktail can be mixed up in minutes with a handful of ingredients"]
cocktail_difficulty = ["easy", "medium", "hard"]

#Garnish
garnish_name = ["Mint", "Blueberries", "Orange Peel", "Coffee Beans", "Cucumber", "Lime", "Lemon"]
# t.boolean "edible"

#Mixers
mixer_name = ["Coca Cola", "Orange Juice", "Fanta", "Tonic Water", "Lemonade", "Diet Tonic", "Tomate Juice"]
# t.string "sweet_sour"

#Users
user_names = ["Barry White", "Susan Smith", "Fred Norton", "Alan Shearer", "Clare Balding", "Jussi Jaskelianan", "Carol Baskin"]
#age
#favourite_cocktail
user_locations = ["Berlin", "Manchester", "Kettering", "Bolton", "Clapham", "Inverness", "Cardif", "Plymouth"]
#active

puts "Starting Seeding.....Start time: #{Time.now}"

CocktailMixer.destroy_all
CocktailGarnish.destroy_all
CocktailAlcohol.destroy_all
Alcohol.destroy_all
Garnish.destroy_all
Cocktail.destroy_all
User.destroy_all
Mixer.destroy_all



#Alcohol
50.times do
    alc = Alcohol.new(
    {
        name: alcohol_name.sample,
        colour: alcohol_colour.sample,
        alcohol_content: (30..60).to_a.sample
    }
    )
    if alc.valid? 
        alc.save
        puts "Alcohol '#{alc.name}' seeded succesfully."
    end
end

#Garnish
    50.times do
        garn = Garnish.new(
        {
            name: garnish_name.sample,
            edible: [true, false].sample
     
        }
        )
        if garn.valid? 
            garn.save
            puts "Garnish '#{garn.name}' seeded succesfully."
        end
end


#Mixer 
50.times do
    mix = Mixer.new(
    {
        name: mixer_name.sample,
        sweet_sour: ["Sweet", "Sour"].sample
 
    }
    )
    if mix.valid? 
        mix.save
        puts "Mixer '#{mix.name}' seeded succesfully."
    end
end

#users
50.times do
    person = User.new(
    {
        name: user_names.sample,
        email: "#{person.name.delete(' ').downcase}@gmail.com"
        age: (18..60).to_a.sample,
        favourite_cocktail: "random",
        location: user_locations.sample,

 
    }
    )
    if person.valid? 
        person.save
        puts "User '#{person.name}' seeded succesfully."
    end
end



#cocktail
50.times do
    cock = Cocktail.new(
    {
        name: cocktail_names.sample,
        calories: (0..500).to_a.sample,
        instructions: cocktail_instructions.sample,
        description: cocktail_descriptions.sample,
        difficulty: cocktail_difficulty.sample,
        user_id: User.all.sample.id #only seeds a user when the cocktail name is different
 

    }
    )
    if cock.valid? 
        cock.save
        puts "User '#{cock.name}' seeded succesfully."
    end
end


#cocktail_garnish
20.times do
        CocktailGarnish.create(
    {
        cocktail_id: Cocktail.all.sample.id,
        garnish_id: Garnish.all.sample.id
 
    }
    )

end

#cocktail_mixers
20.times do
    CocktailMixer.create(
{
    cocktail_id: Cocktail.all.sample.id,
    mixer_id: Mixer.all.sample.id

}
)
end

#cocktail_alcohol
20.times do
    CocktailAlcohol.create(
{
    cocktail_id: Cocktail.all.sample.id,
    alcohol_id: Alcohol.all.sample.id

}
)
end


rails g migration AddPasswordDigestToUsers password_digest:string