class CheesecakeProject::Scraper
  
  def self.scrape_recipes   #class method.  Why are you using a class method vs an instance method?? What is the difference?
                            # If we don't want to create the object of class then we use the class method if we want call the method
                            # through object of a class then we use the instance method
                            #article-content-container two-col-content-container
                                                                                         # 1. open site  2. parse next
     
    doc = Nokogiri::HTML(open("http://dish.allrecipes.com/favorite-fall-cheesecakes"))     
    
    recipes = doc.css("div.article-content-container.two-col-content-container strong")
    #.map { |link| link.css("a").children.text }
    # recipe_names.reject!{ |e| e.empty? }
    # recipe_url = doc.css("div.article-content-container.two-col-content-container strong").map { |link| link.css("a").attribute("href").value }
    # recipe_names.reject!{ |e| e.empty? }
    
    recipes.each_with_index do |r, i|
      if i != 1
        name = r.css("a").text
        url = r.css("a").attribute("href").value 
        CheesecakeProject::Recipes.new(name, url)
      end
      
      
      
    end
  end
  
  def self.scrape_ingredients(recipe)             #receiving an object/instance 
    doc = Nokogiri::HTML(open(recipe.url))
    
    ingredients = doc.css("#lst_ingredients_1 li")
    ingredients2 = doc.css("#lst_ingredients_2 li")
 
    ingredients.each do |ingredient|
      name = ingredient.css("span").text 

      recipe.ingredients << name 
    end  
    ingredients2.each do |ingredient|
      name = ingredient.css("span").text 
      recipe.ingredients << name 
    end
   
    recipe.ingredients.pop
  end
  
  def self.scrape_directions(recipe)        #receiving an object/instance 
    doc = Nokogiri::HTML(open(recipe.url))
    
    directions = doc.css(".recipe-directions__list li")

    directions.each do |direction|
      
      name = direction.css("span").text 
        recipe.directions << name 
    end
  end
end
