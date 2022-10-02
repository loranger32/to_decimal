module ToDecimal
  class WrongInputBaseError < ArgumentError; end

  NUMBERS = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze

  class Base
    attr_reader :base

    def initialize(base)
      validate_base(base)
      @base = base
      freeze
    end

    def [](input)
      validate_input(input)

      convert(input)
    end

    private

    def convert(input)
      if input.is_a?(Integer)
        input.to_s.to_i(base)
      else
        Integer(input, base)
      end
    end

    def validate_base(base)
      raise ArgumentError, "Base must be an Integer" unless base.is_a?(Integer)
      raise ArgumentError, "Base must be 2..36" unless \
        (2..36) === base
    end

    def validate_input(input)
      err_value = "Argument must be an integer or a valid string\
 representation of an integer. You input : #{input}, of class #{input.class}."
      raise ArgumentError, err_value unless valid_integer_string_or_integer?(input)

      err_base = "A number of base #{base} cannot have a\
  digit greater than '#{NUMBERS[base - 1]}'. Check your argument: '#{input}'."
      raise WrongInputBaseError, err_base unless valid_input_base?(input)
    end

    def valid_integer_string_or_integer?(input)
      valid_integer?(input) || valid_integer_string?(input)
    end

    def valid_integer?(input)
      input.is_a?(Integer)
    end

    def valid_integer_string?(input)
      return false unless input.is_a?(String)
      input = remove_leading_zeros(input)

      return false unless input.match?(/\A[a-z0-9]+\z/i)
      true
    end

    def valid_input_base?(input)
      input = input.to_s
      digitized_input = input.chars.map(&:downcase)
      digitized_input.none? { |digit| NUMBERS.index(digit) > base - 1 }
    end

    def remove_leading_zeros(input)
      input.sub(/\A0+/, "")
    end
  end
end
