class CLI

  def run
    greeting
    Scraper.get_data
    @companies = display_companies_list
    ask_user_input


    while @input != "exit"
      display_company_detail
      ask_user_input
      if @input == "exit"
        break
      end
    end
    puts "Thanks for visiting, Have a great day!"
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

    until sanitize_user_input
      puts 'Error, Check your spelling, Please Try Again:'
      ask_user_input
    end
  end

  def sanitize_user_input
    smallest_companies_name = @companies.min{|a,b| a.size <=> b.size}
   if @input.gsub(" ", "").match?(/^[A-Za-z]+$/) && @input.length >= smallest_companies_name.length
     true
   elsif @input.match?(/&/)
     @companies.any? {|name| name == @input }
   else
     false
   end
  end

  def display_company_detail
   dow = Dowjones.find_by_name(@input)

   puts "\nCompany: #{dow.company_name}"
   puts "Price: #{dow.stock_price}"

   if dow.change_in_price.to_f > 0.0
   puts "Price Change: #{dow.change_in_price.colorize(:green)}"
   puts "Percentage Change: #{dow.change_in_percent.colorize(:green)}"
   else
     puts "Price: #{dow.change_in_price.colorize(:red)}"
     puts "Percentage Change: #{dow.change_in_percent.colorize(:red)}"
   end


  end


end