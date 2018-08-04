class StubProduct
  class << self
    def prices
      products['prices']
    end

    def discounts
      products['discounts']
    end

    private

    def products
      @products ||= YAML.load_file('./spec/fixtures/products.yml')
    end
  end
end
