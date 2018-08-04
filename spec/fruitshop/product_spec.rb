RSpec.describe Fruitshop::Product do
  describe '#price' do
    fixture(:products)['prices'].each do |price|
      context "for an #{price['unique_name']}" do
        let(:product) { described_class.new(price['unique_name']) }

        it "return #{price['value']} cents" do
          allow(Fruitshop::Price).to receive(:all_products).and_return(StubPrice.all_products)

          expect(product.price).to eq(price['value'])
        end
      end
    end
  end

  describe '#even_discount' do
    fixture(:products)['discounts'].each do |discount|
      context "for an #{discount['unique_name']}" do
        let(:product) { described_class.new(discount['unique_name']) }
        let(:per_product_counter) { { product => 2 } }

        it "return #{discount['value']} cents" do
          allow(Fruitshop::Discount).to receive(:all_products).and_return(StubDiscount.all_products)

          expect(product.even_discount(per_product_counter)).to eq(discount['value'])
        end
      end
    end
  end
end
