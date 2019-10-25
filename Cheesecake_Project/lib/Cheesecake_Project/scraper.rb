class CheesecakeProject::Scraper
  
  def self.scrape_recipes   #class method
    doc = Nokogiri::HTML(open("http://dish.allrecipes.com/favorite-fall-cheesecakes/?internalSource=streams&referringId=387&referringContentType=Recipe%20Hub&clickId=st_trending_b"))
  end
  
end