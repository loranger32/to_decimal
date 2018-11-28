module ToDecimal
  class Validator
    def initialize(input, base)
      @input = input
      @base = base
    end

    def validate
      raise ArgumentError, "Argument must be an integer or a valid string\
 representation of an integer. You input : #{@input}" unless valid_integer_string_or_integer?
      
      raise WrongBaseInputError, "A number of base #{@base} cannot have a digit\
 greater or equal to #{@base}. Check your argument: #{@input}" unless valid_input_base?
    end

    private

    def valid_integer_string_or_integer?
       @input.is_a?(Integer) || (@input.is_a?(String) && @input.to_i.to_s == @input)
    end

    def valid_input_base?
      digitized_input = @input.to_i.digits
      digitized_input.none? { |digit| digit >= @base }
    end
  end
end