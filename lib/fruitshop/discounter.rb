module Fruitshop
  class Discounter
    def initialize(source: './data/discounts.yml')
      @all = YAML.load_file(source)
    end

    def call(product:, count:)
      return 0 unless count.even?
      @all.fetch(product.unique_name, 0)
    end
  end
end
