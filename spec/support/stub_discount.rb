class StubDiscount
  class << self
    def all_products
      @all_products ||= YAML.load_file('./spec/fixtures/products.yml')['discounts']
    end
  end
end
