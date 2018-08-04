module Fruitshop
  class Pricer
    def initialize(source: './data/prices.yml')
      @all = YAML.load_file(source)
    end

    def call(product:)
      selected_products = @all.select do |price|
        price['product_unique_name'] == product.unique_name
      end

      if selected_products.empty?
        raise ArgumentError
      end

      selected_products.first['value']
    end
  end
end
