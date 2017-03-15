url = "http://bleacherreport.com/tennis"
url2 = "http://www.bbc.com/sport/swimming"
doc2 = Nokogiri::HTML(open(url2))
doc = Nokogiri::HTML(open(url))
@results = doc.css('.articleContent')
@swimming_results = doc2.css('.lakeside__body')

url3 = "https://www.eventbrite.sg/d/marine-parade/events/?crt=regular&sort=date"
doc_events = Nokogiri::HTML(open(url3))
@events = doc_events.css('.list-card-v2')
puts @events
