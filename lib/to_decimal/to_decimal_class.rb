module ToDecimal
  class Convertor
    attr_reader :base

    def initialize(base=10)
      @base = format_and_validate(base)
    end

    def [](input)
      formatted_input = format(input).digits
      validate_input(formatted_input)
      decimal = 0
      formatted_input.each_with_index do |digit, power|
        decimal += digit * (base**power)
      end
      decimal
    end

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
 expected as argument"
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

    def validate_input(formatted_input)
      if formatted_input.any? { |digit| digit >= base }
        raise WrongBaseInputError, "A number of base #{base} cannot have a digit\
 greater or equal to #{base}. Check your argument: #{formatted_input.reverse.join}"
      end
    end
  end
end
