RSpec.describe Fruitshop::Pricer do
  subject { Fixtures.pricer.call(product: product) }

  Fixtures.prices.each do |price|
    context "for a product named '#{price['product_unique_name']}'" do
      let(:product) { Fruitshop::Product.new(price['product_unique_name']) }
      it { is_expected.to eq price['value'] }
    end
  end
end
