module Fruitshop
  class Discount
    class << self
      def all
        @all ||= YAML.load_file('./data/discounts.yml')['discounts']
      end

      def product_name(product_unique_name)
        selected_products =
          all.select { |discount| discount['product_unique_name'] == product_unique_name }

        return 0 unless selected_products.count.positive?

        selected_products.first['value']
      end
    end
  end
end
