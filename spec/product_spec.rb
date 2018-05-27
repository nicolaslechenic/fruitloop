RSpec.describe Fruitshop::Product do
  describe '#price' do
    {
      'Pommes'  => 100,
      'Cerises' => 75,
      'Bananes' => 150
    }.each do |uniq_name, unit_price|
      context "for an #{uniq_name}" do
        let(:product) { described_class.new(uniq_name) }

        it "return #{unit_price} cents" do
          expect(product.price).to eq(unit_price)
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
