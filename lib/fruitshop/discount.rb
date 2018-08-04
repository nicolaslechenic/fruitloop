module Fruitshop
  class Discount
    class << self
      def all_products
        Product.all['discounts']
      end

      def product_name(unique_name)
        selected_products =
          all_products.select { |product| product['unique_name'] == unique_name }

        return 0 unless selected_products.count.positive?

        selected_products.first['value']
      end
    end
  end
end
