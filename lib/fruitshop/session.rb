module Fruitshop
  class Session
    def initialize(output:, cash_register:)
      @output = output
      @cash_register = cash_register
    end

    def read(enumerable_inputs)
      enumerable_inputs.each do |input_line|
        product = Fruitshop::Product.new(input_line.chomp)
        @cash_register.add(product)
        @output.puts @cash_register.total
      end
    end
  end
end
