module Fruitshop
  class Pricer
    class << self
      def all
        @all ||= YAML.load_file('./data/prices.yml')
      end

      def call(product:)
        selected_products = all.select do |price|
          price['product_unique_name'] == product.unique_name
        end

        raise ArgumentError unless selected_products.count.positive?

        selected_products.first['value']
      end
    end
  end
end
