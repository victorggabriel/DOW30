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
    p @@all
  end


end



