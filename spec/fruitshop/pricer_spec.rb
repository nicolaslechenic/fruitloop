RSpec.describe Fruitshop::Pricer do
  subject { described_class.call(product: product) }

  before do
    allow(Fruitshop::Pricer).to receive(:all).and_return(Fixtures.prices)
  end

  Fixtures.prices.each do |price|
    context "for a product named '#{price['product_unique_name']}'" do
      let(:product) { Fruitshop::Product.new(price['product_unique_name']) }
      it { is_expected.to eq price['value'] }
    end
  end
end
