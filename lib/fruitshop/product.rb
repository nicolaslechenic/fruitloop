module Fruitshop
  Product = Struct.new(:unique_name) do
    remove_method :unique_name=

    def price
      Price.product_name(unique_name)
    end

    def discount(per_product_counter)
      if unique_name == 'Cerises' && per_product_counter[self].even?
        - 20
      else
        0
      end
    end
  end
end
