class CheesecakeProject::Recipes
  
  attr_accessor :name, :url, :ingredients, :directions
  
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @ingredients = []
    @directions = []
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
end