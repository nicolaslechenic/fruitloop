RSpec.describe Fruitshop::Discounter do
  subject { described_class.call(product: product, count: product_count) }

  before do
    allow(Fruitshop::Discounter).to receive(:all).and_return(Fixtures.discounts)
  end

  Fixtures.discounts.each do |discount|
    context "for a product named '#{discount['product_unique_name']}'" do
      let(:product) { Fruitshop::Product.new(discount['product_unique_name']) }

      context "when product_count is odd" do
        let(:product_count) { rand(100) * 2 + 1 }
        it { is_expected.to eq 0 }
      end

      context "when product_count is even" do
        let(:product_count) { rand(100) * 2 }
        it { is_expected.to eq discount['value'] }
      end
    end
  end
end
