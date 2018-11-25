class CLI

  def run
    greeting
    Scraper.get_data
    @companies = display_companies_list
    ask_user_input
    until sanitize_user_input
      puts 'Error, Check your spelling, Please Try Again:'
      ask_user_input
    end
    display_company_detail
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
     true
   elsif @input.match?(/&/)
     @companies.any? {|name| name == @input }
   else
     false
   end
  end

  def display_company_detail
  binding.pry
  end


end