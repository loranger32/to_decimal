require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/to_decimal'

# ========== Data for the tests ================================================

TEST_VALUES_BASE_2 = [[101, 2, 5], [100_000_000, 2, 256]]
TEST_VALUES_BASE_3 = [[1122111, 3, 1201], [12, 3, 5]]
TEST_VALUES_BASE_4 = [[11001, 4, 321], [322, 4, 58]]
TEST_VALUES_BASE_5 = [[14, 5, 9], [10011302, 5, 78952]]
TEST_VALUES_BASE_6 = [[13, 6, 9], [1405304, 6, 78952]]
TEST_VALUES_BASE_7 = [[12, 7, 9], [446116, 7, 78952]]
TEST_VALUES_BASE_8 = [[11, 8, 9], [232150, 8, 78952]]
TEST_VALUES_BASE_9 = [[10, 9, 9], [130264, 9, 78952]]
TEST_VALUES_BASE_10 = [[9, 10, 9], [78952, 10, 78952]]

# ========== Test helper methods ===============================================

def execute_test_of_to_d(test_values)
  test_values.each do |data_set|
    @convertor.base = data_set[1]
    assert_equal data_set[2], @convertor.to_d(data_set[0]) 
  end
end

def execute_test_of_to_d_class_method(test_values)
  test_values.each do |data_set|
    assert_equal data_set[2], ToDecimal.to_d(data_set[0], base: data_set[1])
  end
end

class ToDecimalConvertorTest < Minitest::Test
  # ======== Setup =============================================================

  def setup
    @convertor = ToDecimal.new
  end

  # ======== Testing initialization process ====================================

  def test_initialization_without_argument_has_default_base
    assert_equal 10, @convertor.base
  end

  def test_initialization_with_arguments_has_base
    @new_convertor = ToDecimal.new(8)
    assert_equal 8, @new_convertor.base
  end

  def test_initialization_accepts_also_string_as_base
    @new_convertor = ToDecimal.new('4')
    assert_equal 4, @new_convertor.base
  end

  # ======== Testing accessing and modifying attributes ========================

  def test_base_can_be_updated
    @convertor.base = 2
    assert_equal(2, @convertor.base)
    @convertor.base = 8
    assert_equal(8, @convertor.base)
  end

  def test_base_can_also_be_updated_with_a_string
    @convertor.base = '4'
    assert_equal 4, @convertor.base
  end

  # ========= Testing ArgumentError is raised with invalid base attribute ======

  def test_raises_an_error_if_base_arg_is_not_an_integer_or_a_string
    assert_raises(ArgumentError) { @convertor.base = [3] }
    assert_raises(ArgumentError) { @convertor.base = :sym }
  end

  def test_raises_an_error_if_base_arg_is_greater_than_10
    assert_raises(ArgumentError) { @convertor.base = 12 }
  end

  def test_raises_an_error_if_base_arg_is_smaller_than_1
    assert_raises(ArgumentError) { @convertor.base = 0 }
    assert_raises(ArgumentError) { @convertor.base = -4 }
  end

  # ======== Testing error is raises if input is not of the correct base =======
  
  def test_to_d_raises_error_if_input_is_not_from_base_2
    @convertor.base = 2
    assert_raises(WrongBaseInputError) { @convertor.to_d(2) }
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  def test_to_d_raises_error_if_input_is_not_from_base_3
    @convertor.base = 3
    assert_raises(WrongBaseInputError) { @convertor.to_d(3) }
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  def test_to_d_raises_error_if_input_is_not_from_base_4
    @convertor.base = 4
    assert_raises(WrongBaseInputError) { @convertor.to_d(4) }
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  def test_to_d_raises_error_if_input_is_not_from_base_5
    @convertor.base = 5
    assert_raises(WrongBaseInputError) { @convertor.to_d(5) }
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  def test_to_d_raises_error_if_input_is_not_from_base_6
    @convertor.base = 6
    assert_raises(WrongBaseInputError) { @convertor.to_d(6) }
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  def test_to_d_raises_error_if_input_is_not_from_base_7
    @convertor.base = 7
    assert_raises(WrongBaseInputError) { @convertor.to_d(7) }
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  def test_to_d_raises_error_if_input_is_not_from_base_8
    @convertor.base = 8
    assert_raises(WrongBaseInputError) { @convertor.to_d(8) }
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  def test_to_d_raises_error_if_input_is_not_from_base_9
    @convertor.base = 9
    assert_raises(WrongBaseInputError) { @convertor.to_d(9) }
  end

  # ========= Testing return values of to_d instance method ====================

  def test_to_d_returns_decimal_value_of_number_of_base_2
    execute_test_of_to_d(TEST_VALUES_BASE_2)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_3
    execute_test_of_to_d(TEST_VALUES_BASE_3)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_4
    execute_test_of_to_d(TEST_VALUES_BASE_4)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_5
    execute_test_of_to_d(TEST_VALUES_BASE_5)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_6
    execute_test_of_to_d(TEST_VALUES_BASE_6)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_7
    execute_test_of_to_d(TEST_VALUES_BASE_7)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_8
    execute_test_of_to_d(TEST_VALUES_BASE_8)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_9
    execute_test_of_to_d(TEST_VALUES_BASE_9)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_10
    execute_test_of_to_d(TEST_VALUES_BASE_10)
  end

  # ========= Testing aliased to_decimal instance method =======================

  def test_square_brackets_is_alias_for_to_d
    convertor = ToDecimal.new(10)
    assert_equal(200, convertor[200])
  end

  # ========= Testing to_d class method accepts both string and integer args ===

  def test_to_d_class_method_accepts_integers_for_both_parameters
    assert_silent { ToDecimal.to_d(101, base: 2) }
  end

  def test_to_d_class_method_accepts_strings_for_both_parameters
    assert_silent { ToDecimal.to_d('101', base: '2') }
  end
  
  def test_to_d_class_method_accepts_mixed_strings_and_integers_as_args
    assert_silent { ToDecimal.to_d('101', base: 2) }
    assert_silent { ToDecimal.to_d(101, base: '2') } 
  end

  # ======== Testing to_d class method raises error with invalid parameters ====

  def test_to_d_class_method_raises_error_if_first_arg_is_not_string_or_integer
    assert_raises(ArgumentError) { ToDecimal.to_d(:sym, base: 5) }
    assert_raises(ArgumentError) { ToDecimal.to_d([4], base: 5) }
  end

  def test_to_d_class_method_raises_error_if_base_arg_is_not_an_integer_or_str
    assert_raises(ArgumentError) { ToDecimal.to_d('222', base: [5]) }
    assert_raises(ArgumentError) { ToDecimal.to_d(45, base: :sym) }
  end

  def test_to_d_class_method_raises_an_error_if_base_arg_is_greater_than_10
    assert_raises(ArgumentError) { ToDecimal.to_d(456, base: 12) }
  end

  def test_to_d_class_method_raises_an_error_if_base_arg_is_smaller_than_1
    assert_raises(ArgumentError) { ToDecimal.to_d(456, base: 0) }
    assert_raises(ArgumentError) { ToDecimal.to_d(456, base: -8) }
  end

  # ======== Testing return values of to_d class method ========================
  
  def test_to_d_class_method_returns_decimal_value_of_number_of_base_2
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_2)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_3
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_3)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_4
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_4)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_5
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_5)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_6
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_6)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_7
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_7)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_8
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_8)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_9
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_9)
  end

  def test_to_d_class_method_returns_decimal_value_of_number_of_base_10
    execute_test_of_to_d_class_method(TEST_VALUES_BASE_10)
  end
end
