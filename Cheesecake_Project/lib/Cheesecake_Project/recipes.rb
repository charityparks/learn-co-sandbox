class CheesecakeProject::Recipes
  
  attr_accessor :name, :url, :ingredients
  
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @ingredients = []
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
end