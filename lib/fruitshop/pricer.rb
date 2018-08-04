module Fruitshop
  class Pricer
    class << self
      def all
        @all ||= YAML.load_file('./data/prices.yml')['prices']
      end

      def product_name(product_unique_name)
        selected_products =
          all.select { |price| price['product_unique_name'] == product_unique_name }

        raise ArgumentError unless selected_products.count.positive?

        selected_products.first['value']
      end
    end
  end
end
