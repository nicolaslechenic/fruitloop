RSpec.describe Fruitshop::Session do
  describe '#read' do
    let(:output) { FakeOutput.new }
    let(:cash_register) { Fruitshop::CashRegister.new }
    let(:inputs) { ["Cerises\n", "Cerises\n"] }
    let(:instance) { described_class.new(output: output, cash_register: cash_register) }

    subject(:read) { instance.read(inputs) }

    it "outputs the cash_register's total right after adding each input (as a product)" do
      read
      expect(output).to eq(["75\n", "130\n"])
    end
  end
end
