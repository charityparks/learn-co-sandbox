class CheesecakeProject::Scraper
  
  def self.scrape_recipes   #class method
    doc = Nokogiri::HTML(open("http://dish.allrecipes.com/favorite-fall-cheesecakes"))
    
    recipes = doc.css(".entry-content h3")
    
    recipes.each do |r|
      name = r.css("a").text
      url = r.css("a").attribute("href").value 
      
      CheesecakeProject::Recipes.new(name, url)
    end
  end
  def self.scrape_ingredients(recipe) #receiving an object/instance 
    doc = Nokogiri::HTML(open(recipe.url))
    
    ingredients = doc.css("#lst_ingredients_1 li")
    ingredients2 = doc.css("#lst_ingredients_2 li")
    
    ingredients.each do |ingredient|
      name = ingredient.css("span").text 
      recipe.ingredients << name 
    end
    
    recipe.ingredients.pop
  end
  
end