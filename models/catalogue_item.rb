require 'json'

class CatalogueItem
  attr_accessor :sku, :name, :price, :promotions

  def initialize(h)
    h.each{|k,v| public_send("#{k}=", v)}
  end

end
