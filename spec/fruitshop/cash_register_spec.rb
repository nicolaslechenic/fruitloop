RSpec.describe Fruitshop::CashRegister do
  let(:instance) { described_class.new(pricer: pricer, discounter: discounter) }

  describe '#add' do
    let(:pricer) { double(call: product_price) }
    let(:discounter) { double(call: product_discount) }
    let(:product) { instance_double(Fruitshop::Product) }
    let(:product_price) { 100 }

    context 'without discount' do
      let(:product_discount) { 0 }

      it 'increment total by the price of the product' do
        expect { instance.add(product) }
          .to change { instance.total }
          .by(product_price)
      end
    end

    context 'with discount' do
      let(:product_discount) { 20 }

      it 'apply discount on total price' do
        expect { instance.add(product) }
          .to change { instance.total }
          .by(product_price - product_discount)
      end
    end
  end
end
