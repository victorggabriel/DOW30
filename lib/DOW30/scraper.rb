class Scraper

  def self.get_data
    html = Nokogiri::HTML(open("https://www.investing.com/indices/investing.com-united-states-30-components"))
  end

end