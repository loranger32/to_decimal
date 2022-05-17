require_relative 'to_decimal/validator_class'
require_relative 'to_decimal/convertor_class'
require_relative 'to_decimal/wrong_base_input_error'

module ToDecimal
  Base2 = Base.new(2)
  Base3 = Base.new(3)
  Base4 = Base.new(4)
  Base5 = Base.new(5)
  Base6 = Base.new(6)
  Base7 = Base.new(7)
  Base8 = Base.new(8)
  Base9 = Base.new(9)
  Base10 = Base.new(10)

  # Ensure no other convertor object will be created
  class Base
    class << self
      private :new
    end
  end
end
