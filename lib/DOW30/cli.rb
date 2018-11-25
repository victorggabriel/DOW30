class CLI

  def run
    greeting
    Scraper.get_data
    display_companies_list
    binding.pry
    ask_user_input
    sanitize_user_input
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

  def sanitize_user_input
   if @input.gsub(" ", "").match?(/^[A-Za-z]+$/)
     display_companies_list
   end
  end

  def display_company_detail

  end


end