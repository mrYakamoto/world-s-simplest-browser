=begin
Basic Responsibilities
-Display a prompt for the user
-Parse the user input
-Fetch a web page
-Extract the relevant information from the web page
-Displaying the relevant information in a user-friendly way
=end

require 'net/http'
require 'uri'
require 'nokogiri'

require_relative 'page'

class Browser
  def run!
    url = ''
    until url == 'exit'
      puts "Enter a url"
      url = gets.chomp
      break if url == 'exit'
      puts "url> " + url
      puts "Fetching..."
      Page.new(url).display_page
    end
    puts "goodbye"
    # Display useful results by instantiating
    #   a new Page and calling methods on it.

    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
  end


end


