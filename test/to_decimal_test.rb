require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/to_decimal'

# ========== Data for the tests ================================================

TEST_VALUES_BASE_2 = [[101, 5], [100_000_000, 256]]
TEST_VALUES_BASE_3 = [[1122111, 1201], [12, 5]]
TEST_VALUES_BASE_4 = [[11001, 321], [322, 58]]
TEST_VALUES_BASE_5 = [[14, 9], [10011302, 78952]]
TEST_VALUES_BASE_6 = [[13, 9], [1405304, 78952]]
TEST_VALUES_BASE_7 = [[12, 9], [446116, 78952]]
TEST_VALUES_BASE_8 = [[11, 9], [232150, 78952]]
TEST_VALUES_BASE_9 = [[10, 9], [130264, 78952]]
TEST_VALUES_BASE_10 = [[9, 9], [78952, 78952]]

# ========== Test helper methods ===============================================

def execute_test_with(test_values, base_convertor)
  test_values.each do |data_set|
    assert_equal data_set[1], base_convertor[data_set[0]] 
  end
end

class ToDecimalBaseValidationTest < Minitest::Test

  # ======== Testing error is raises if input is not of the correct base =======
  
  def test_raises_error_if_input_is_not_from_base_2
    base2 = ToDecimal::Base2
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

# ========= Testing return values of [] instance method ======================
class ToDecimalConvserionTest < Minitest::Test
  def test_returns_decimal_value_of_number_of_base_2
    execute_test_with(TEST_VALUES_BASE_2, ToDecimal::Base2)
  end

  def test_returns_decimal_value_of_number_of_base_3
    execute_test_with(TEST_VALUES_BASE_3, ToDecimal::Base3)
  end

  def test_returns_decimal_value_of_number_of_base_4
    execute_test_with(TEST_VALUES_BASE_4, ToDecimal::Base4)
  end

  def test_returns_decimal_value_of_number_of_base_5
    execute_test_with(TEST_VALUES_BASE_5, ToDecimal::Base5)
  end

  def test_returns_decimal_value_of_number_of_base_6
    execute_test_with(TEST_VALUES_BASE_6, ToDecimal::Base6)
  end

  def test_returns_decimal_value_of_number_of_base_7
    execute_test_with(TEST_VALUES_BASE_7, ToDecimal::Base7)
  end

  def test_returns_decimal_value_of_number_of_base_8
    execute_test_with(TEST_VALUES_BASE_8, ToDecimal::Base8)
  end

  def test_returns_decimal_value_of_number_of_base_9
    execute_test_with(TEST_VALUES_BASE_9, ToDecimal::Base9)
  end

  def test_returns_decimal_value_of_number_of_base_10
    execute_test_with(TEST_VALUES_BASE_10, ToDecimal::Base10)
  end
end

class ConvertorCannotBeInstantiatedTest < Minitest::Test
  def test_raises_error_if_user_tries_to_instantiate_new_convertor
    assert_raises(NoMethodError) { ToDecimal::Convertor.new }
  end
end