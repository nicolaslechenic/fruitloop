module Fruitshop
  Product = Struct.new(:unique_name) do
    remove_method :unique_name=

    class << self
      def all
        @all ||= YAML.load_file('./products.yml')
      end
    end

    def price
      @price ||= Price.product_name(unique_name)
    end

    def even_discount(per_product_counter)
      return 0 unless per_product_counter[self].even?
      
      @even_discount ||= Discount.product_name(unique_name)
    end
  end
end
