module Fruitshop
  class Product
    def initialize(uniq_name)
      @uniq_name = uniq_name
    end

    def price
      case @uniq_name
      when 'Pommes'
        100
      when 'Cerises'
        75
      when 'Bananes'
        150
      else
        raise ArgumentError
      end
    end

    def discount(per_product_counter)
      if @uniq_name == 'Cerises' && per_product_counter[self].even?
        - 20
      else
        0
      end
    end

    def ==(other)
      self.class === other && other.uniq_name == @uniq_name
    end

    alias eql? ==

    def hash
      @uniq_name.hash
    end

    attr_reader :uniq_name
    protected :uniq_name
  end
end
