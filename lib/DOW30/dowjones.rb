class Dowjones

  attr_accessor :company_name, :stock_price, :change_in_price, :change_in_percent, :volume
  @@all = []

  #send call the attribute setter method for the object

  def initialize(dow_hash)
   dow_hash.each do |key, value|
     self.send("#{key}=", value)
   end
    @@all << self
  end

  def self.all
     @@all
  end

  def self.find_by_index(index)
     self.all[index]
  end

  def self.company_names_collection
    self.all.collect do |dow_obj|
      dow_obj.company_name
    end
  end

  def self.find_by_name(company)
    self.all.each do |key|
      if key.company_name.upcase == company.upcase
        puts "#{key.company_name} is trading at #{key.stock_price}"
      end
    end
  end


end



