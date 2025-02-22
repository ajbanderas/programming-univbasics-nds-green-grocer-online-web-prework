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
  current_item = find_item_by_name_in_collection(item, cons_cart)
  if !current_item
    cons_cart << {:item => item, :price => price, :clearance => clearance, :count => 1}
  else
    current_item[:count] += 1
  end
  item_index += 1
 end
 cons_cart
end

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
def apply_coupons(cart, coupons)
  index = 0 
  while index < coupons.length do
    coupon_item = coupons[index][:item]
    req_num = coupons[index][:num]
    sale_price = coupons[index][:cost]
    matching_item = find_item_by_name_in_collection(coupon_item, cart)
    if matching_item && req_num <= matching_item[:count]
      matching_item[:count] -= req_num
      cart << {:item => "#{coupon_item} W/COUPON", 
               :price => (sale_price / req_num), 
               :clearance => matching_item[:clearance], 
               :count => req_num}
    end
    index += 1 
  end
 cart
end

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
def apply_clearance(cart)
  index = 0 
  while index < cart.length do
    if cart[index][:clearance] == true
      cart[index][:price] = (cart[index][:price] * 0.8).round(2)
    end
    index += 1
  end
  cart
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
  grand_total = 0 
  final_purchases = consolidate_cart(cart)
  apply_coupons(final_purchases, coupons)
  apply_clearance(final_purchases)
  index = 0 
  while index < final_purchases.length
      grand_total += (final_purchases[index][:price] * final_purchases[index][:count])
    index += 1
  end
  if grand_total > 100
    grand_total = (grand_total *0.9).round(2)
  end
  grand_total
end
