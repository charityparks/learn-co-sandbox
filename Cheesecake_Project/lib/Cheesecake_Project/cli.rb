class CheesecakeProject::CLI
  def call
    puts "Enjoy these recipes!"
    get_recipes
    list_recipes
  end
  
  def get_recipes
    @recipes = ["Caramel Macchiato Cheesecake", "Apple Cheesecake with Caramel Sauce", "Turtles® Cheesecake", "Double Layer Pumpkin Cheesecake"]
  end
  # The @recipes is a class variable 
  
  def list_recipes
    @recipes.each.with_index(1) do |recipe, index| 
            puts "#{index}.#{recipe}"
          end
        end
  
end