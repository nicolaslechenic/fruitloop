RSpec.describe Fruitshop::Discounter do
  subject { Fixtures.discounter.call(product: product, count: product_count) }

  Fixtures.discounts.each do |product_name, expected_discount|
    context "for a product named '#{product_name}'" do
      let(:product) { Fruitshop::Product.new(product_name) }

      context "when product_count is odd" do
        let(:product_count) { rand(100) * 2 + 1 }
        it { is_expected.to eq 0 }
      end

      context "when product_count is even" do
        let(:product_count) { rand(100) * 2 }
        it { is_expected.to eq expected_discount }
      end
    end
  end

  context "for a product that have no entry in the discounts" do
    let(:product) { Fruitshop::Product.new("NoRealProduct") }
    let(:product_count) { rand(100) }
    it { is_expected.to eq 0 }
  end
end
