# This is the environment file.  It is letting it be aware of your cli and version files.

require_relative "./Cheesecake_Project/version"
require_relative "./Cheesecake_Project/cli"
require_relative "./Cheesecake_Project/recipes"
require_relative "./Cheesecake_Project/scraper"

require 'pry'
require 'nokogiri'

module CheesecakeProject
  class Error < StandardError; end
  # Your code goes here...
end
