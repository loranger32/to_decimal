class Gutils
  class Conversion
    attr_reader :input_number, :decimal_integer, :base_format

    def initialize(input_number=0, base=10)
      @input_number    = format(input_number)
      @base_format     = validate(base)
      @decimal_integer = 0
    end

    def self.to_d(digit, base)
      new(digit, base).to_d
    end

    def input=(integer)
      @input_number = format(integer)
    end

    def base=(integer)
      @base_format = validate(integer)
    end

    def to_d
      reset
      digitize.each_with_index do |digit, power|
        @decimal_integer += digit * (base_format**power)
      end
      decimal_integer
    end

    def to_d_with(input, base)
      self.input = format(input)
      self.base  = validate(base)
      reset
      to_d
    end

    def reset
      @decimal_integer = 0
    end

    alias_method :to_decimal, :to_d

    private

    def format(input_number)
      if input_number.is_a?(String) || input_number.is_a?(Integer)
        if input_number.is_a?(String)
          input_number.to_i
        else
          input_number
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
      input_number.digits
    end
  end
end

convertor = Gutils::Conversion.new
p convertor.to_d_with(1231, 4)
