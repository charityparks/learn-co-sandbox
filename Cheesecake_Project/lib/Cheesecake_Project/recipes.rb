class CheesecakeProject::Recipes
  
  attr_accessor :name, :url, :ingredients, :directions   #these are attributes of the object @Recipes

  
  @@all = []                     #class variable
  
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