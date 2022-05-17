module ToDecimal
  # The main class that performs the actual conversion
  class Base
    attr_reader :base

    def initialize(base)
      validate_base(base)
      @base = base
      freeze
    end

    def [](input)
      input = remove_leading_zeros_of(input)
      Validator.new(input, base).validate

      input_as_integer = integerize(input)
      convert(input_as_integer)
    end

    private

    def remove_leading_zeros_of(input)
      input.is_a?(String) ? input.sub(/\A0+/, '') : input
    end

    def convert(integer)
      integer.to_s.to_i(base)
    end

    def integerize(input)
      input.is_a?(String) ? input.to_i : input
    end

    def validate_base(base)
      raise ArgumentError, 'Base must be an Integer' unless base.is_a?(Integer)
      raise ArgumentError, 'Base must be 2..36' unless \
        (2..36) === base
    end
  end
end
