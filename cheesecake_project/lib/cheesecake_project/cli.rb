class CheesecakeProject::CLI
  
  
  def call
    puts "Welcome to the best Fall Cheesecakes!"
  end
  
  def get_recipes
    @recipes = ["Caramel Macchiato Cheesecake", "Apple Cheesecake with Caramel Sauce", "Turtles® Cheesecake", "Double Layer Pumpkin Cheesecake"]
  end
  
  def list_recipes
    @recipes.each.with_index(1) do |index, recipe| 
      puts "#{index}.#{recipe}"
    end
    
    def hello(hello)
    end
      

end