require 'Pry'
require 'Nokogiri'
require 'open-uri'

url = "http://bleacherreport.com/tennis"
doc = Nokogiri::HTML(open(url))
article_div = doc.css('.articleContent')
article_div.each do |article_content|
  article_content.at_css("a h3 span").text
  puts article_content.at_css("a")['href']
  puts article_content.at_css("img")['src']
  # puts article_content.xpath("//a/h3/span").text
end
