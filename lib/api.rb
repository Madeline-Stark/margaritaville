class API

    def self.fetch_drinks
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)

        array_of_drinks = hash["drinks"]

        # strDrink - name
        # strInstructions
        # strGlass 
        # strInstructionsDE
        # :name, :instructions, :glass, :german_instructions

        array_of_drinks.each do |drink_hash|
            drink = Drink.new
            drink.name = drink_hash["strDrink"]
            drink.instructions = drink_hash["strInstructions"]
            drink.glass = drink_hash["strGlass"]
            drink.german_instructions = drink_hash["strInstructionsDE"]
        end 
    end

end