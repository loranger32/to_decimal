module ToDecimal
  # Class to validate arguments
  class Validator
    def initialize(input, base)
      @input = input
      @base = base
    end

    def validate
      err_value = "Argument must be an integer or a valid string\
 representation of an integer. You input : #{@input}, of class #{@input.class}."
      raise ArgumentError,  err_value unless valid_integer_string_or_integer?

      err_base = "A number of base #{@base} cannot have a\
  digit greater or equal to #{@base}. Check your argument: #{@input}."
      raise WrongBaseInputError, err_base unless valid_input_base?
    end

    private

    def valid_integer_string_or_integer?
      valid_integer_string? || valid_integer?
    end

    def valid_integer?
      @input.is_a?(Integer)
    end

    def valid_integer_string?
      (@input.is_a?(String) && @input.to_i.to_s == @input)
    end

    def valid_input_base?
      digitized_input = @input.to_i.digits
      digitized_input.none? { |digit| digit >= @base }
    end
  end
end
