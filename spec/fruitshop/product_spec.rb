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

  describe '#discount' do
    context 'for the second element of pair of "Cerises"' do
      let(:cerise) { described_class.new('Cerises') }
      let(:per_product_counter) { { cerise => 2 } }

      it 'return -20 cents' do
        expect(cerise.discount(per_product_counter)).to eq(-20)
      end
    end
  end
end
