class Scraper

  def self.get_data
    html = Nokogiri::HTML(open("https://www.investing.com/indices/investing.com-united-states-30-components"))
    table = html.css("tbody")
    table_row = table.css("tr")[1..29]

    table_row.each do |row|
      id = row.attribute("id").value.split("_").last
      #id = row.first[1].split("_").last
      company_name = row.search("a").text
      stock_price = row.css(".pid-#{id}-last").text.to_f
      Dowjones.new(company_name, stock_price)
    end
  end


end
