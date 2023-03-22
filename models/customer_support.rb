require 'json'

require_relative 'order'
require_relative 'catalogue_item'
require_relative 'receipt'

class CustomerSupport
  attr_accessor :orders, :catalog, :receipts

  def initialize
    @orders = load_orders
    @catalog = load_catalog
    @receipts = []
  end

  def load_catalog
    file = File.read('.././catalog.json')
    data_hash = JSON.parse(file)
    catalogues = data_hash.map do |hash|
      CatalogueItem.new(hash)
    end
    catalogues
  end

  def load_orders
    file = File.read('.././orders.json')
    data_hash = JSON.parse(file)
    orders = data_hash.map do |hash|
      Order.new(hash)
    end
    orders
  end

  def create_receipts
    @orders.each do |order|
      customer = order.customer
      order_id = order.id

      receipt = Receipt.new(customer, order_id)
      if order.member_no
        receipt.membership_rewards = true
      end
      order.items.each do |items|
        quantity = items['quantity']
        sku = items['sku']
        catalogue_item = look_up_catalog(sku)
        name = catalogue_item.name
        price = catalogue_item.price
        receipt.products << {quantity: quantity, name: name, price: price}
      end
      @receipts << receipt
    end
  end

  def print_summary
    accumulated_cost = 0
    @receipts.each do |receipt|
      receipt.print_receipt
      accumulated_cost += receipt.total
    end
    print_accumulated_summary_output(accumulated_cost, @orders.count)
  end

  def print_summary_single_order(order_id)
    receipt = search_receipt_from_order_id(order_id)
    if receipt
      receipt.print_receipt
      accumulated_cost = receipt.total
      print_accumulated_summary_output(accumulated_cost, 1)
    else
      raise StandardError.new "The provided order number is invalid. There is no order with id number:#{order_id}."
    end
  end

  def print_accumulated_summary_output(cost, orders_count)
    puts "Summary"
    puts "#{orders_count} #{orders_count > 1 ? 'orders' : 'order'}"
    puts "Total $#{show_two_decimals(cost)}"
  end

  def search_receipt_from_order_id(id)
    @receipts.find{|receipt| receipt.order_no == id}
  end

  def show_two_decimals(price)
    '%.2f' % price
  end

  def look_up_catalog(sku)
    @catalog.select do |c_item|
       c_item.sku == sku
    end.first
  end


  def print_order_summary
    grand_total = 0
    order_count = 0
    sort_through_orders
    order_count, grand_total = loop_through_report(order_count, grand_total)
    print_summary(order_count, grand_total)
  end

end

cs = CustomerSupport.new
cs.create_receipts
receipt = cs.receipts.first
receipt.print_receipt
cs.print_summary
