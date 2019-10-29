class CheesecakeProject::Recipes
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    CheesecakeProject::Scraper.scrape_recipes if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end
  
end