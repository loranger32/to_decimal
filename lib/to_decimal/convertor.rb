module ToDecimal
  class Convertor
    attr_reader :input, :base

    def initialize(input=0, base=10)
      @input    = format(input)
      @base     = validate(base)
    end

    def self.to_d(digit, base)
      new(digit, base).to_d
    end

    def input=(integer)
      @input = format(integer)
    end

    def base=(integer)
      @base = validate(integer)
    end

    def to_d
      decimal = 0
      digitize.each_with_index do |digit, power|
        decimal += digit * (base**power)
      end
      decimal
    end

    def to_d_with(input, base)
      self.input = format(input)
      self.base  = validate(base)
      to_d
    end

    alias_method :to_decimal, :to_d

    private

    def format(input)
      if input.is_a?(String) || input.is_a?(Integer)
        if input.is_a?(String)
          input.to_i
        else
          input
        end
      else
        raise ArgumentError, "Input number must be Integer or String \
  representation of an Integer"
      end
    end

    def validate(base)
      raise ArgumentError, "Base must be an Integer" unless base.is_a?(Integer)
      raise ArgumentError, "Base must be 1..10" unless base > 0 && base <= 10
      base
    end

    def digitize
      input.digits
    end
  end
end
