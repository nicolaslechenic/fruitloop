RSpec.describe Fruitshop::CashRegister do
  let(:instance) { described_class.new }

  describe 'the total when buying two cerises' do
    def cerise
      Fruitshop::Product.new('Cerises')
    end
    
    let(:product_discount) { -20 }

    it 'apply discount on total price' do
      2.times { instance.add(cerise) }

      expect(instance.total).to eq(cerise.price * 2 + product_discount)
    end
  end
end
