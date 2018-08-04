module Fruitshop
  class Discounter
    def initialize(source: './data/discounts.yml')
      @all = YAML.load_file(source)
    end

    def call(product:, count:)
      return 0 unless count.even?

      selected_products = @all.select do |discount|
        discount['product_unique_name'] == product.unique_name
      end

      if selected_products.empty?
        return 0
      end

      selected_products.first['value']
    end
  end
end
