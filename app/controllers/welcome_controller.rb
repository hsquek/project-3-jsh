class WelcomeController < ApplicationController
  def index
    url = "http://bleacherreport.com/tennis"
    url2 = "http://www.bbc.com/sport/swimming"
    doc2 = Nokogiri::HTML(open(url2))
    doc = Nokogiri::HTML(open(url))
    @results = doc.css('.articleContent')
    @swimming_results = doc2.css('.lakeside__body')

    url3 = "https://www.eventbrite.sg/d/marine-parade/events/?crt=regular&sort=date"
    doc_events = Nokogiri::HTML(open(url3))
    @events = doc_events.css('.list-card-v2')

    # url = "http://feeds.bbci.co.uk/sport/tennis/rss.xml?edition=int#"
    # @feed = Feedjira::Feed.fetch_and_parse(url)
    # puts @feed

    #the code below does not apply
    # @image_results = doc.css('.articleMedia')

      # article_content.at_css("a h3 span").text
      # puts article_content.at_css("a")['href']
      # puts article_content.at_css("img")['src']
      # puts article_content.xpath("//a/h3/span").text
  end

  def gencode

  end
end
