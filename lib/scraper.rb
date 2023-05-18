require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = doc.css(".student-card").map do |student| 
      {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => student.css("a")[0].attributes['href'].value
      }
    
    end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

Scraper.scrape_index_page "https://learn-co-curriculum.github.io/student-scraper-test-page/"