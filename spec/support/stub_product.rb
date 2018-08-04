module Fixtures
  def self.prices
    @prices ||= YAML.load_file('./spec/fixtures/prices.yml')
  end

  def self.discounts
    @discounts ||= YAML.load_file('./spec/fixtures/discounts.yml')
  end
end
