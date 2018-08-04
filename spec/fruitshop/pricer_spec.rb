RSpec.describe Fruitshop::Pricer do
  subject { Fixtures.pricer.call(product: product) }

  Fixtures.prices.each do |product_name, expected_price|
    context "for a product named '#{product_name}'" do
      let(:product) { Fruitshop::Product.new(product_name) }
      it { is_expected.to eq expected_price }
    end
  end
end
