RSpec.describe Fruitshop::Session do
  describe '#read' do
    subject(:read) { instance.read(inputs) }

    let(:inputs) { ["Cerises\n", "Cerises\n"] }

    it "outputs the cash_register's total right after adding each input (as a product)" do
      cerises_product = Fruitshop::Product.new('Cerises')

      inputs.size.times do
        expect(cash_register).to receive(:add).with(cerises_product).ordered
        expect(output).to receive(:puts).with(cash_register.total).ordered
      end

      read
    end
  end

  let(:instance) { described_class.new(output: output, cash_register: cash_register) }
  let(:output) { instance_double(IO, puts: nil) }
  let(:cash_register) { instance_double(Fruitshop::CashRegister, add: nil, total: 100) }
end
