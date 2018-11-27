require_relative 'to_decimal/to_decimal_class'
require_relative 'to_decimal/wrong_base_input_error'

module ToDecimal
  Base2 = Convertor.new(2).freeze
  Base3 = Convertor.new(3)
  Base4 = Convertor.new(4)
  Base5 = Convertor.new(5)
  Base6 = Convertor.new(6)
  Base7 = Convertor.new(7)
  Base8 = Convertor.new(8)
  Base9 = Convertor.new(9)
  Base10 = Convertor.new

  class Convertor
    class << self
      private :new
    end
  end
end