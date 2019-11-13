class CheesecakeProject::Scraper
  
  def self.scrape_recipes   #class method.  Why are you using a class method vs an instance method?? What is the difference?
                            # If we don't want to create the object of class then we use the class method if we want call the method
                            # through object of a class then we use the instance method
                            
                                                                                         # 1. open site  2. parse next
     
    doc = Nokogiri::HTML(open("http://dish.allrecipes.com/favorite-fall-cheesecakes"))     
    
    recipes = doc.css("div.article-content-container.two-col-content-container strong a")
    
    recipes.each do |r|                                  # iterating through the container called recipes
        name = r.text                                    # and assigning variables to the values for name and url
        url = r.attribute("href").value 
        CheesecakeProject::Recipes.new(name, url)        # creating a new instance of the CheesecakeProject class w/ 
    end                                                  # name and url attributes
  end
  
  def self.scrape_ingredients(recipe)                 
    doc = Nokogiri::HTML(open(recipe.url))
    
    ingredients = doc.css("#lst_ingredients_1 li span")
    ingredients2 = doc.css("#lst_ingredients_2 li span")
 
    ingredients.each do |ingredient|
      name = ingredient.text 
      recipe.ingredients << name 
    end  
    
    ingredients2.each do |ingredient|
      name = ingredient.text 
      recipe.ingredients << name 
    end
   
    recipe.ingredients.pop               #to get rid of the empty element
  end
  
  def self.scrape_directions(recipe)                              #receiving an object/instance 
    doc = Nokogiri::HTML(open(recipe.url))
    
    directions = doc.css(".recipe-directions__list li")

    directions.each do |direction|
        recipe.directions << direction.css("span").text 
    end
  end
end
