require "./product.rb"
require "./category.rb"

class Inventory
  def initialize
    @categories = []
    caps = [
      Product.new("", "Baseball cap-girl", 25)];
    @categories << Category.new( "Baseball shoes", shoe_products)
    shoe_products = [
      Product.new("Basseball shoe-NY", 50),
      Product.new("Baseball shoe-WS", 48)
      ];
  end
  def get_product product_name
    @categories.each do |category|
      category.products.each do |product|
        if product.name == product_name
          return product
        end
      end
    end
    "ow no its not here"
  end

  def list
    @categories.each do |category|
      puts category.name
      category.products.each do |product|
          puts "-- #{product.name}"
      end
    end
