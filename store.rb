@shopping_cart = []

@categories = [ :caps, :bats, :shirts, :pants ]

@products = {
  :caps => [
    { :reference_number => 1000, :name => "baseball cap-pro", :price => 30 },
    { :reference_number => 1001, :name => "baseball cap-child", :price => 20 },
  ],
  :bats => [
    { :reference_number => 1233, :name => "Baseball bat-pro", :price => 130 },
    { :reference_number => 1234, :name => "Baseball bat-child", :price => 90 },
  ],
  :shirts => [
    { :reference_number => 1235, :name => "Baseball shirt NY", :price => 120 },
    { :reference_number => 1236, :name => "Baseball shirt White Sox", :price => 110 },
  ],
  :pants => [
    { :reference_number => 1237, :name => "Baseball pants NY", :price => 140 },
    { :reference_number => 1238, :name => "Baseball pants White Sox", :price => 130 },
  ]
}

def select_category
  puts "Check out our store articles by category:"

  @categories.each do |category|
    puts "#{category.to_s}"
  end

  puts "." * 40
  puts "Please select your category by name:"
  gets.chomp
end

def show_products(category)
  puts "*" * 40

  category = category.to_sym
  products = @products[category]

  products.each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
    puts "-" * 40
  end

  products
end

def choose_reference_number
  puts "Select item to buy by its reference_number:"
  gets.chomp
end

def add_product_to_shopping_cart(products, reference_number)
  while true
    product = look_up_product(products, reference_number)
    if product != nil
      @shopping_cart << product
      puts "Congratulations. '#{product[:name]}' has been added to the cart!"
      break
    else
      puts "You might have selected a invalid reference_number. Please try again:"
    end
  end
end

def look_up_product(products, reference_number)
  products.each do |product|
    if product[:reference_number] == reference_number.to_i
      return product
    end
  end

  nil
end

def print_cart
  puts "." * 40
  puts "CURRENT SHOPPING CART"
  puts "." * 40
  @shopping_cart.each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
    puts "." * 40
  end

  @shopping_cart
end

puts "Welcome to Mike's Baseballstore!"

category = select_category
products = show_products(category)
reference_number = choose_reference_number
add_product_to_shopping_cart(products, reference_number)
print_cart
