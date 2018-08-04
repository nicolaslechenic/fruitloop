module Fruitshop
  class CashRegister
    attr_reader :products

    def initialize(pricer: Pricer.new, discounter: Discounter.new)
      @pricer = pricer
      @discounter = discounter
      @products = []
    end

    def add(product)
      @products << product
    end

    def total
      per_product_counter = Hash.new(0)

      @products.reduce(0) do |total, product|
        product_count = (per_product_counter[product] += 1)
        product_price = @pricer.(product: product)
        discount = @discounter.(product: product, count: product_count)

        total + product_price - discount
      end
    end
  end
end
