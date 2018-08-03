class StubPrice
  class << self
    def all_products
      @all_products ||= YAML.load_file('./spec/fixtures/products.yml')['prices']
    end
  end
end
