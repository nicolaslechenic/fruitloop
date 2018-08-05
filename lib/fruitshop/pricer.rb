module Fruitshop
  class Pricer
    def initialize(source: './data/prices.yml')
      @all = YAML.load_file(source)
    end

    def call(product:)
      @all.fetch(product.unique_name)
    end
  end
end
