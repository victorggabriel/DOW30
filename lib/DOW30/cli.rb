class CLI

  def run
    greeting
    #binding.pry
    Scraper.get_data
    display_companies_list
    ask_user_input
  end

  def greeting
    puts "Welcome to next Gen Stock Market App!\nThis will show all the companies listed in the Dow Jones 30\n\n"
  end

  def display_companies_list
    Dowjones.company_names_collection.each { |name| puts "#{name}" }
  end

  def ask_user_input
    puts "\nSelect Company from the list above\nEnter company name: "
    @input = gets.strip
  end


end