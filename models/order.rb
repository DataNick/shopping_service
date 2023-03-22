require 'json'

class Order
  attr_accessor :id, :customer, :items, :member_no

  def initialize(h)
    h.each{|k,v| public_send("#{k}=", v)}
  end

end
