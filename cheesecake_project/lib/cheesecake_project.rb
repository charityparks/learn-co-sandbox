#this is the environment file

require "cheesecake_project/version"
require_relative "./cheesecake_project/version"
require_relative "./cheesecake_project/cli"
require "pry"

module CheesecakeProject
  class Error < StandardError; end
  # Your code goes here...
end
