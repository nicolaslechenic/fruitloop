RSpec.describe Fruitshop::CashRegister do
  let(:instance) { described_class.new }

  fixture(:products)['discounts'].each do |discount|
    describe "the total when buying two #{discount['product_unique_name']}" do
      let(:product) { Fruitshop::Product.new(discount['product_unique_name']) }
      let(:product_discount) { discount['value'] }

      it 'apply discount on total price' do
        2.times { instance.add(product) }

        allow(Fruitshop::Pricer).to receive(:all).and_return(StubProduct.prices)
        allow(Fruitshop::Discounter).to receive(:all).and_return(StubProduct.discounts)

        expect(instance.total).to eq(product.price * 2 - product_discount)
      end
    end
  end
end
