class CheesecakeProject::Cli      # Here the CheesecakeProject is the module and cli is the class inside the module. The cli is to                                      #interact with the user.
  def call
    puts "\nTop 10 Fall Cheesecake recipes!"
    get_recipes
    list_recipes
    user_choice
  end
  
  def get_recipes
    CheesecakeProject::Scraper.scrape_recipes      #calling the scrape.recipes method
    
    @recipes = CheesecakeProject::Recipes.all
  end
  
  # The @recipes is a class variable 
  
  def list_recipes
    puts "Choose the number of the recipe you'd like to see."
    
    @recipes.each.with_index(1) do |recipe, index| 
            puts "#{index}.#{recipe.name}"
          end
        end
        
  def user_choice
    chosen_number = gets.strip.to_i
    show_recipe_for(chosen_number) if valid_input(chosen_number, @recipes)
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0 
  end
  
  def show_recipe_for(chosen_number)
    recipe = @recipes[chosen_number - 1]
    
    CheesecakeProject::Scraper.scrape_ingredients(recipe)
    
    puts "\nHere are the ingredients needed for the #{recipe.name}..."
    
    recipe.ingredients.each.with_index(1) do |ingredient, index|
      puts "#{index}. #{ingredient}"
    end
    
    get_directions(recipe)
  end
  
  def get_directions(recipe)  
    CheesecakeProject::Scraper.scrape_directions(recipe)
    
      puts "Here are the cooking directions..."
        recipe.directions.each.with_index(1) do |directions, index| 
            puts "#{index}.#{directions}"
          end
        end
    
  
end