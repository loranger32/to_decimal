module ToDecimal

  def self.to_d(digit, base: 10)
    self::Convertor.new(base).to_d(digit)
  end

  def self.from_base_8
    self::Convertor.new(8)
  end

  class Convertor
    attr_reader :input, :base

    def initialize(base=10)
      @base = format_and_validate(base)
    end

    def input=(new_input)
      @input = format(new_input)
    end

    def base=(new_base)
      @base = format_and_validate(new_base)
    end

    def to_d(input)
      formatted_input = format(input).digits
      decimal = 0
      formatted_input.each_with_index do |digit, power|
        decimal += digit * (base**power)
      end
      decimal
    end

    def to_d_with(new_input, new_base)
      self.input = format(new_input)
      self.base  = format_and_validate(new_base)
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
        raise ArgumentError, "Integer or String representation of an Integer\
 expected as input or base"
      end
    end

    def validate_base(base)
      raise ArgumentError, "Base must be an Integer" unless base.is_a?(Integer)
      raise ArgumentError, "Base must be 1..10" unless base > 0 && base <= 10
    end

    def format_and_validate(base)
      formatted_base = format(base)
      validate_base(formatted_base)
      formatted_base
    end
  end
end
