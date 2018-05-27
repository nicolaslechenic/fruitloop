module Fruitshop
  class CashRegister
    attr_reader :products

    def initialize
      @products = []
    end

    def add(product)
      @products << product
    end

    def total
      per_product_counter = Hash.new(0)

      @products.reduce(0) do |total, product|
        per_product_counter[product] += 1

        total + product.price + product.discount(per_product_counter)
      end
    end
  end
end
