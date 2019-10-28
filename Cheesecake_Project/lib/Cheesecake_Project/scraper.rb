class CheesecakeProject::Scraper
  
  def self.scrape_recipes   #class method
    doc = Nokogiri::HTML(open("http://dish.allrecipes.com/favorite-fall-cheesecakes/?internalSource=streams&referringId=387&referringContentType=Recipe%20Hub&clickId=st_trending_b")
    recipes = doc.css(<h1 id="recipe-main-content")
    
    recipes.each do |r|
      name = r.text
      
      CheesecakeProject::Recipes.new(name)
    end
  end
  
end