require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/to_decimal'

class ToDecimalBaseValidationTest < Minitest::Test

  # ======== Testing error is raised if input is not of the correct base =======

  def test_raises_error_if_input_is_not_from_base_2
    base2 = ToDecimal::Base2
    assert_raises(ToDecimal::WrongBaseInputError) { base2[2] }
    assert_raises(ToDecimal::WrongBaseInputError) { base2[9] }

    base2 = ToDecimal::Base.new(2)
    assert_raises(ToDecimal::WrongBaseInputError) { base2[2] }
    assert_raises(ToDecimal::WrongBaseInputError) { base2[9] }
  end

  def test_raises_error_if_input_is_not_from_base_3
    base3 = ToDecimal::Base3
    assert_raises(ToDecimal::WrongBaseInputError) { base3[3] }
    assert_raises(ToDecimal::WrongBaseInputError) { base3[9] }
  end

  def test_raises_error_if_input_is_not_from_base_4
    base4 = ToDecimal::Base4
    assert_raises(ToDecimal::WrongBaseInputError) { base4[4] }
    assert_raises(ToDecimal::WrongBaseInputError) { base4[9] }
  end

  def test_raises_error_if_input_is_not_from_base_5
    base5 = ToDecimal::Base5
    assert_raises(ToDecimal::WrongBaseInputError) { base5[5] }
    assert_raises(ToDecimal::WrongBaseInputError) { base5[9] }
  end

  def test_raises_error_if_input_is_not_from_base_6
    base6 = ToDecimal::Base6
    assert_raises(ToDecimal::WrongBaseInputError) { base6[6] }
    assert_raises(ToDecimal::WrongBaseInputError) { base6[9] }
  end

  def test_raises_error_if_input_is_not_from_base_7
    base7 = ToDecimal::Base7
    assert_raises(ToDecimal::WrongBaseInputError) { base7[7] }
    assert_raises(ToDecimal::WrongBaseInputError) { base7[9] }
  end

  def test_raises_error_if_input_is_not_from_base_8
    base8 = ToDecimal::Base8
    assert_raises(ToDecimal::WrongBaseInputError) { base8[8] }
    assert_raises(ToDecimal::WrongBaseInputError) { base8[9] }
  end

  def test_raises_error_if_input_is_not_from_base_9
    base9 = ToDecimal::Base9
    assert_raises(ToDecimal::WrongBaseInputError) { base9[9] }
  end
end

# ========= Testing return values of [] method =================================

# ========= Test helper method

def execute_test_with(test_values, base_convertor)
  test_values.each do |data_set|
    assert_equal data_set[1], base_convertor[data_set[0]]
  end
end

# ========= Test class

class ToDecimalConvserionFromIntegerTest < Minitest::Test

  # Test data
  TEST_VALUES_BASE_2 = [[101, 5], [100_000_000, 256]].freeze
  TEST_VALUES_BASE_3 = [[1_122_111, 1201], [12, 5]].freeze
  TEST_VALUES_BASE_4 = [[11_001, 321], [322, 58]].freeze
  TEST_VALUES_BASE_5 = [[14, 9], [10_011_302, 78_952]].freeze
  TEST_VALUES_BASE_6 = [[13, 9], [1_405_304, 78_952]].freeze
  TEST_VALUES_BASE_7 = [[12, 9], [446_116, 78_952]].freeze
  TEST_VALUES_BASE_8 = [[11, 9], [232_150, 78_952]].freeze
  TEST_VALUES_BASE_9 = [[10, 9], [130_264, 78_952]].freeze
  TEST_VALUES_BASE_10 = [[9, 9], [78_952, 78_952]].freeze

  def test_returns_decimal_value_of_integer_of_base_2
    execute_test_with(TEST_VALUES_BASE_2, ToDecimal::Base2)
  end

  def test_returns_decimal_value_of_integer_of_base_3
    execute_test_with(TEST_VALUES_BASE_3, ToDecimal::Base3)
  end

  def test_returns_decimal_value_of_integer_of_base_4
    execute_test_with(TEST_VALUES_BASE_4, ToDecimal::Base4)
  end

  def test_returns_decimal_value_of_integer_of_base_5
    execute_test_with(TEST_VALUES_BASE_5, ToDecimal::Base5)
  end

  def test_returns_decimal_value_of_integer_of_base_6
    execute_test_with(TEST_VALUES_BASE_6, ToDecimal::Base6)
  end

  def test_returns_decimal_value_of_integer_of_base_7
    execute_test_with(TEST_VALUES_BASE_7, ToDecimal::Base7)
  end

  def test_returns_decimal_value_of_integer_of_base_8
    execute_test_with(TEST_VALUES_BASE_8, ToDecimal::Base8)
  end

  def test_returns_decimal_value_of_integer_of_base_9
    execute_test_with(TEST_VALUES_BASE_9, ToDecimal::Base9)
  end

  def test_returns_decimal_value_of_integer_of_base_10
    execute_test_with(TEST_VALUES_BASE_10, ToDecimal::Base10)
  end
end

class ToDecimalConvserionFromStringTest < Minitest::Test
  TEST_VALUES_BASE_2 = [['101', 5], ['100000000', 256]].freeze
  TEST_VALUES_BASE_3 = [['1122111', 1_201], ['12', 5]].freeze
  TEST_VALUES_BASE_4 = [['11001', 321], ['322', 58]].freeze
  TEST_VALUES_BASE_5 = [['14', 9], ['10011302', 78_952]].freeze
  TEST_VALUES_BASE_6 = [['13', 9], ['1405304', 78_952]].freeze
  TEST_VALUES_BASE_7 = [['12', 9], ['446116', 78_952]].freeze
  TEST_VALUES_BASE_8 = [['11', 9], ['232150', 78_952]].freeze
  TEST_VALUES_BASE_9 = [['10', 9], ['130264', 78_952]].freeze
  TEST_VALUES_BASE_10 = [['9', 9], ['78952', 78_952]].freeze

  def test_returns_decimal_value_of_string_of_base_2
    execute_test_with(TEST_VALUES_BASE_2, ToDecimal::Base2)
  end

  def test_returns_decimal_value_of_string_of_base_3
    execute_test_with(TEST_VALUES_BASE_3, ToDecimal::Base3)
  end

  def test_returns_decimal_value_of_string_of_base_4
    execute_test_with(TEST_VALUES_BASE_4, ToDecimal::Base4)
  end

  def test_returns_decimal_value_of_string_of_base_5
    execute_test_with(TEST_VALUES_BASE_5, ToDecimal::Base5)
  end

  def test_returns_decimal_value_of_string_of_base_6
    execute_test_with(TEST_VALUES_BASE_6, ToDecimal::Base6)
  end

  def test_returns_decimal_value_of_string_of_base_7
    execute_test_with(TEST_VALUES_BASE_7, ToDecimal::Base7)
  end

  def test_returns_decimal_value_of_string_of_base_8
    execute_test_with(TEST_VALUES_BASE_8, ToDecimal::Base8)
  end

  def test_returns_decimal_value_of_string_of_base_9
    execute_test_with(TEST_VALUES_BASE_9, ToDecimal::Base9)
  end

  def test_returns_decimal_value_of_string_of_base_10
    execute_test_with(TEST_VALUES_BASE_10, ToDecimal::Base10)
  end
end

class RemoveLeadingZeroesFromStringsTest < Minitest::Test
  TEST_VALUES_BASE_2 = [['00101', 5], ['0100000000', 256]].freeze
  TEST_VALUES_BASE_3 = [['001122111', 1_201], ['012', 5]].freeze
  TEST_VALUES_BASE_4 = [['0011001', 321], ['322', 58]].freeze
  TEST_VALUES_BASE_5 = [['0014', 9], ['010011302', 78_952]].freeze
  TEST_VALUES_BASE_6 = [['0013', 9], ['01405304', 78_952]].freeze
  TEST_VALUES_BASE_7 = [['0012', 9], ['0446116', 78_952]].freeze
  TEST_VALUES_BASE_8 = [['0011', 9], ['0232150', 78_952]].freeze
  TEST_VALUES_BASE_9 = [['0010', 9], ['0130264', 78_952]].freeze
  TEST_VALUES_BASE_10 = [['009', 9], ['078952', 78_952]].freeze

  def test_removes_leading_zeros_from_string_with_base2
    execute_test_with(TEST_VALUES_BASE_2, ToDecimal::Base2)
  end

  def test_removes_leading_zeros_from_string_with_base3
    execute_test_with(TEST_VALUES_BASE_3, ToDecimal::Base3)
  end

  def test_removes_leading_zeros_from_string_with_base4
    execute_test_with(TEST_VALUES_BASE_4, ToDecimal::Base4)
  end

  def test_removes_leading_zeros_from_string_with_base5
    execute_test_with(TEST_VALUES_BASE_5, ToDecimal::Base5)
  end

  def test_removes_leading_zeros_from_string_with_base6
    execute_test_with(TEST_VALUES_BASE_6, ToDecimal::Base6)
  end

  def test_removes_leading_zeros_from_string_with_base7
    execute_test_with(TEST_VALUES_BASE_7, ToDecimal::Base7)
  end

  def test_removes_leading_zeros_from_string_with_base8
    execute_test_with(TEST_VALUES_BASE_8, ToDecimal::Base8)
  end

  def test_removes_leading_zeros_from_string_with_base9
    execute_test_with(TEST_VALUES_BASE_9, ToDecimal::Base9)
  end

  def test_removes_leading_zeros_from_string_with_base10
    execute_test_with(TEST_VALUES_BASE_10, ToDecimal::Base10)
  end
end