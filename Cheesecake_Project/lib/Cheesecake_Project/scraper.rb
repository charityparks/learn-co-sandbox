class CheesecakeProject::Scraper
  
  def self.scrape_recipes   #class method
    doc = Nokogiri::HTML(open("http://dish.allrecipes.com/favorite-fall-cheesecakes"))
    
    recipes = doc.css("h1#recipe-main-content")
    
    recipes.each do |r|
      name = r.text
      
      CheesecakeProject::Recipes.new(name)
    end
  end
  
end