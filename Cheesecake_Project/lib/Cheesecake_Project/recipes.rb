class CheesecakeProject::Recipes
  
  @@all = ["Caramel Macchiato Cheesecake", "Apple Cheesecake with Caramel Sauce", "Turtles® Cheesecake", "Double Layer Pumpkin Cheesecake"]
  
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