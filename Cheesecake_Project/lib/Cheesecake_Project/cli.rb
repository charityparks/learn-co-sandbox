class CheesecakeProject::Cli      # Here the CheesecakeProject is the module and cli is the class inside the module. The cli is to                                      #interact with the user.
  def call
    puts "Enjoy these recipes!"
    get_recipes
    list_recipes
    user_choice
  end
  
  def get_recipes
    @recipes = CheesecakeProject::Recipes.all
    
    #["Caramel Macchiato Cheesecake", "Apple Cheesecake with Caramel Sauce", "Turtles® Cheesecake", "Double Layer Pumpkin Cheesecake"]
  end
  
  # The @recipes is a class variable 
  
  def list_recipes
    puts "Choose the number of the recipe you'd like to view."
    @recipes.each.with_index(1) do |recipe, index| 
            puts "#{index}.#{recipe}"
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
    puts "Here is your recipe for the #{recipe}..."
  end
end