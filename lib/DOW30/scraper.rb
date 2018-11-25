class Scraper

  def self.get_data
    html = Nokogiri::HTML(open("https://www.investing.com/indices/investing.com-united-states-30-components"))
    table = html.css("tbody")
    table_row = table.css("tr")[1..29]


    table_row.each do |row|
      id = row.attribute("id").value.split("_").last
      #id = row.first[1].split("_").last

      dow_company = {
      company_name:  row.search("a").text,
      stock_price: row.css(".pid-#{id}-last").text.to_f,
      volume: row.css(".pid-#{id}-turnover").text
      }


      if !row.css(".bold.redFont").empty?
        dow_company[:change_in_price] = row.css(".bold.redFont.pid-#{id}-pc").text
        dow_company[:change_in_percent] = row.css(".bold.redFont").last.text
      else
        dow_company[:change_in_price] = row.css(".bold.greenFont.pid-#{id}-pc").text
        dow_company[:change_in_percent] = row.css(".bold.greenFont").last.text
      end


      Dowjones.new(dow_company)
    end


  end
end
