require 'nokogiri'

class Page
  attr_reader :nokogiri_doc, :title

  def initialize(url)
    @url = url
    @nokogiri_doc = fetch!
    @title = grab_title
    @links = links
  end

  def fetch!
    html_string = Net::HTTP.get(URI(@url))
    clean_html = HTMLWhitespaceCleaner.clean(html_string)
    Nokogiri.parse(clean_html)
  end

  def grab_title
    @nokogiri_doc.css('title').text
  end

  def display_page
    puts "\nTitle: " + @title
    puts "Content length: " + content_length.to_s + " characters"
    puts "\nLinks: \n"
    display_links
  end

  def content_length
    @nokogiri_doc.css('body').text.length
  end

  def display_links
    links.each { |link| puts link }
  end

  def links
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
    links_arr = @nokogiri_doc.css('a').map { |link| link['href'] }
    links_arr.compact!
    links_arr.delete('#')
    links_arr.delete('')
    links_arr
  end
end
