class Product
  attr_accessor :name, :reference_number, :price

  def initialize(name, reference_number, price)
    @name = name
    @price = price
    @ireference_number = reference_number
  end
end
