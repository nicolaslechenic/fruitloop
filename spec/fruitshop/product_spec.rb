RSpec.describe Fruitshop::Product do
  describe '#price' do
    fixture(:products)['prices'].each do |price|
      context "for an #{price['product_unique_name']}" do
        let(:product) { described_class.new(price['product_unique_name']) }

        it "return #{price['value']} cents" do
          allow(Fruitshop::Pricer).to receive(:all).and_return(StubProduct.prices)

          expect(product.price).to eq(price['value'])
        end
      end
    end
  end

  describe '#discount' do
    fixture(:products)['discounts'].each do |discount|
      context "for an #{discount['product_unique_name']}" do
        let(:product) { described_class.new(discount['product_unique_name']) }
        let(:product_count) { 2 }

        it "return #{discount['value']} cents" do
          allow(Fruitshop::Discounter).to receive(:all).and_return(StubProduct.discounts)

          expect(product.discount(product_count)).to eq(discount['value'])
        end
      end
    end
  end
end
