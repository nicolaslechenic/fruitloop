module Fruitshop
  Product = Struct.new(:unique_name) do
    remove_method :unique_name=

    def price
      @price ||= Pricer.(product: self)
    end

    def even_discount(per_product_counter)
      return 0 unless per_product_counter[self].even?

      @even_discount ||= Discounter.(product: self)
    end
  end
end
