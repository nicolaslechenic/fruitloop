module Fruitshop
  Product = Struct.new(:unique_name) do
    remove_method :unique_name=

    def price
      @price ||= Pricer.product_name(unique_name)
    end

    def even_discount(per_product_counter)
      return 0 unless per_product_counter[self].even?

      @even_discount ||= Discounter.product_name(unique_name)
    end
  end
end
