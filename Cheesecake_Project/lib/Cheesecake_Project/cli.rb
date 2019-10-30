class CheesecakeProject::Cli      # Here the CheesecakeProject is the module and cli is the class inside the module. The cli is to                                      #interact with the user.
  def call
    puts "\nTop 10 Fall Cheesecake recipes!"
    get_recipes
    list_recipes
    user_choice
  end
  
  def get_recipes
    CheesecakeProject::Scraper.scrape_recipes      #calling the scrape.recipes method
    
    @recipes = CheesecakeProject::Recipes.all       # @recipes is an instance variable
  end
  
  def list_recipes
    puts "Choose the number of the recipe you'd like to see."
    
    @recipes.each.with_index(1) do |recipe, index|         # @recipes is the object that will be iterated over using the each method
            puts "#{index}.#{recipe.name}"                 # Iterate means doing one thing multiple times (a loop)
          end                                              # you iterate over collections such as hashes and arrays
        end
        
  def user_choice                                            # making sure an integer is being used as opposed to a letter
    chosen_number = gets.strip.to_i
    show_recipe_for(chosen_number) if valid_input(chosen_number, @recipes)
  end
  
  def valid_input(input, data)                            #this is making surethe user input is an integer and is between 1 and 10                                                                           
    input.to_i <= data.length && input.to_i > 0 
  end
  
  def show_recipe_for(chosen_number)
    recipe = @recipes[chosen_number - 1]
    
    CheesecakeProject::Scraper.scrape_ingredients(recipe)
    
    puts "\nHere are the ingredients needed for the #{recipe.name}..."
    
    recipe.ingredients.each.with_index(1) do |ingredient, index|            #iterating using the each method like above 
      puts "#{index}. #{ingredient}"
    end
    
    get_directions(recipe)
  end
  
  def get_directions(recipe)  
    CheesecakeProject::Scraper.scrape_directions(recipe)
    
      puts "\nHere are the cooking directions..."
        recipe.directions.pop                                        #.pop gets rid of the last element in an array...this was empty str
        recipe.directions.each.with_index(1) do |directions, index| 
            puts "#{index}.#{directions}"
        end
  end
end