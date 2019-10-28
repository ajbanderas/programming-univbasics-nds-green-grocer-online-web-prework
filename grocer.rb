  # Implement me first!
  #
  # Consult README for inputs and outputs

def find_item_by_name_in_collection(name, collection)
  index = 0 
  while index < collection.length do
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end
  nil
end

  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
def consolidate_cart(cart)
 cons_cart = []
 item_index = 0 
 while item_index < cart.length do 
  item = cart[item_index][:item]
  price = cart[item_index][:price]
  clearance = cart[item_index][:clearance]
  cons_cart << item = {:price => price, :clearance => clearance, :count => 1}
  item_index += 1
 end
 pp cons_cart
 cons_cart
end

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
def apply_coupons(cart, coupons)
  
end

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
def apply_clearance(cart)

end

  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
def checkout(cart, coupons)

end
