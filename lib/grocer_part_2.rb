require_relative './part_1_solution.rb'


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon_item|
    cart.each do |cart_item|
      if cart_item[:item] == coupon_item[:item]
        if cart_item[:count] >= coupon_item[:num]
          a = cart.length
          cart_item[:count] -= coupon_item[:num]
          puts a
          cart[a] = {
            :item => cart_item[:item] + " W/COUPON",
            :price => coupon_item[:cost] / coupon_item[:num],
            :clearance => cart_item[:clearance],
            :count => coupon_item[:num]
            }
        end
      end
    end
  end
  cart      
end


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |grocery_item|
    if grocery_item[:clearance] == TRUE
       new_price = grocery_item[:price] * 0.80
       grocery_item[:price] = new_price.round(2)
    end
  cart
  end
end


def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
end



def find_item_by_name_in_collection(name, collection)
  index = 0

  collection.each do |grocery_item|
    return grocery_item if grocery_item[:item] === name 
    index += 1
  end
  nil
end


def consolidate_cart(cart)
  index = 0
  new_cart = []
  
  cart.each do |grocery_item|
    current_item = find_item_by_name_in_collection(grocery_item[:item], new_cart)
    if current_item
      new_cart_index = 0
      new_cart.each do |new_cart_item|
        if new_cart_item[:item] === current_item[:item]
          new_cart_item[:count] += 1
        end
        new_cart_index += 1
      end
    else
      grocery_item[:count] = 1
      new_cart << grocery_item
    end
    index += 1
  end
  new_cart
end

