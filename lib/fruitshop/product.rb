module Fruitshop
  Product = Struct.new(:unique_name) do
    remove_method :unique_name=

    def price
      @price ||= Pricer.(product: self)
    end

    def discount(product_count)
      Discounter.(product: self, count: product_count)
    end
  end
end
