class Receipt
  attr_accessor :products, :customer, :order_no, :total, :membership_rewards

  MEMBERSHIP_DISCOUNT = 0.2

  def initialize(customer, order_no)
    @customer = customer
    @order_no = order_no
    @membership_rewards = false
    @products = []
    @total = 0
  end

  def print_receipt
    puts "ORDER #{@order_no} (#{@customer})"
    products.each do |product|
      quantity = product[:quantity]
      name = product[:name]
      price = product[:price]
      amount = calculate_price(quantity, price)
      increment_total(amount)
      puts "#{quantity}x #{name} @ $#{price} ea, $#{show_two_decimals(amount)}"
    end
    if @membership_rewards
      discount = discounted_amount(@total)
      discount_string = "(Loyalty discount: $#{show_two_decimals(discount)})"
      @total = apply_member_discount(@total)
    end
    puts "Total: $#{show_two_decimals(@total)} #{@membership_rewards ? discount_string : ''}"
    puts "-"
  end

  def apply_member_discount(amount)
    discount = MEMBERSHIP_DISCOUNT * amount
    amount = amount - discount
  end

  def discounted_amount(amount)
    (MEMBERSHIP_DISCOUNT * amount)
  end

  def increment_total(amount)
    @total += amount
  end

  def show_two_decimals(price)
    '%.2f' % price
  end


  def calculate_price(quantity, price)
    quantity * price
  end


end
