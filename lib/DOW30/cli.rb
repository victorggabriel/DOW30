class CLI

  def run
    greeting
    #binding.pry
    Scraper.get_data
    display_companies_list
  end

  def greeting
    puts "Welcome to next Gen Stock Market App!\nThis will show all the companies listed in the Dow Jones 30\n"
  end

  def display_companies_list
    Dowjones.company_names_collection.each_with_index { |name, index| puts "#{index + 1}. #{name}" }
  end



end