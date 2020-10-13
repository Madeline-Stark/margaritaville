class CLI

    def start
        puts "Welcome"
        API.fetch_drinks
        self.menu
    end

    def menu 
        # give user the option to see list of drinks
        puts "Would you like to see the list of drinks?"
        puts "Type 'yes' to continue or any other key to exit"

        user_input = gets.strip.downcase

        # if the user says yes


        if user_input == "yes" || user_input == "y"
            puts "Good choice!"
            #display the list
            display_list_of_drinks
            ask_user_for_drink_choice

            sleep(2)
            puts "\n"

            menu 
        else 
            puts "Goodbye"
        end

    end 

    def display_list_of_drinks
        # Access all the drinks
        # binding.pry
        # print each one out
        Drink.all.each.with_index(1) do |drink, index|
            puts "#{index}. #{drink.name}"
        end 
    end

    def ask_user_for_drink_choice
        # ask user for choice
        puts "Enter the number of the drink you'd like to know more about"
        index = gets.strip.to_i - 1

        # index valid? number between 0 and 6
        until index.between?(0, Drink.all.length - 1)
            # keep asking for user input
            puts "Sorry invalid. Choose a valid number"
            index = gets.strip.to_i - 1
        end
        
        drink_instance = Drink.all[index]
       
        display_drink_details(drink_instance)
    end 

    def display_drink_details(drink)
        sleep(1)
        puts "\n"
        puts drink.name 
        puts "Glass: " + drink.glass
        puts "Instructions: " + drink.instructions
        puts "German Instructions: " + drink.german_instructions
    end

end