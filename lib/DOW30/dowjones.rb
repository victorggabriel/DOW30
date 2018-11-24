class Dowjones

  attr_accessor :company_name, :stock_price

  @@all = []

  #send call the attribute setter method for the object

  def initialize(dow_hash)
   dow_hash.each do |key, value|
     self.send("#{key}=", value)
   end
  end

  def self.all
    p @@all
  end


end



