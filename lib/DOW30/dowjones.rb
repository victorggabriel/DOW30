class Dowjones

  attr_accessor :company_name, :stock_price

  @@all = []

  def initialize(company_name, stock_price)
    @company_name = company_name
    @stock_price = stock_price
    @@all << self
  end

  def self.all
    p @@all
  end


end