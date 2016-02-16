require_relative 'browser'
require_relative '../html_whitespace_cleaner'

require 'net/http'
require 'uri'
require 'nokogiri'
require 'pp'

Browser.new.run!



# p uri = URI.parse("http://google.com/")

# test = Page.new('http://fusion.net/story/212190/pizza-rat-gets-exciting-new-sequel/')
# test.display_page

# # html_string = Net::HTTP.get(URI('http://fusion.net/story/212190/pizza-rat-gets-exciting-new-sequel/'))
# # clean_html = HTMLWhitespaceCleaner.clean(html_string)
# # nokogiri_doc = Nokogiri.parse(clean_html)
# # a = nokogiri_doc.css('a').map { |link| link['href'] }
# # a.delete('#')
# # p a

