module Fruitshop
  class Discounter
    class << self
      def all
        @all ||= YAML.load_file('./data/discounts.yml')
      end

      def call(product:, count:)
        return 0 unless count.even?

        selected_products = all.select do |discount|
          discount['product_unique_name'] == product.unique_name
        end

        return 0 unless selected_products.count.positive?

        selected_products.first['value']
      end
    end
  end
end
