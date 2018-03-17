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

def populate_convertor(data_set)
  @convertor.input = data_set[0]
  @convertor.base = data_set[1]
end

def execute_test_of_to_d(test_values)
  test_values.each do |data_set|
    populate_convertor(data_set)
    assert_equal data_set[2], @convertor.to_d 
  end
end

def execute_test_of_to_d_with(test_values)
  test_values.each do |data_set|
    populate_convertor(data_set)
    assert_equal data_set[2], @convertor.to_d_with(data_set[0], data_set[1])
  end
end

def execute_test_of_to_d_class_method(test_values)
  test_values.each do |data_set|
    populate_convertor(data_set)
    assert_equal data_set[2], ToDecimal::Convertor.to_d(data_set[0], data_set[1])
  end
end

class ToDecimalConvertorTest < Minitest::Test
  # ======== Setup =============================================================
  def setup
    @convertor = ToDecimal::Convertor.new
  end

  # ======== Testing initialization process ====================================

  def test_initialization_without_argument_has_default_input_and_base
    assert_equal 0, @convertor.input
    assert_equal 10, @convertor.base
  end

  def test_initialization_with_arguments_has_input_and_base
    @new_convertor = ToDecimal::Convertor.new(202, 8)
    assert_equal 202, @new_convertor.input
    assert_equal 8, @new_convertor.base
  end

  def test_initialization_accepts_also_string_as_input
    @new_convertor = ToDecimal::Convertor.new('3098')
    assert_equal 3098, @new_convertor.input
  end

  def test_initialization_accepts_also_string_as_base
    @new_convertor = ToDecimal::Convertor.new('1231', '4')
    assert_equal 4, @new_convertor.base
  end

  # ======== Testing accessing and modifying attributes ========================

  def test_input_can_be_updated
    @convertor.input = 10
    assert_equal 10, @convertor.input
    @convertor.input = 20
    assert_equal 20, @convertor.input
  end

  def test_input_can_also_be_updated_with_a_string
    @convertor.input = '202'
    assert_equal 202, @convertor.input
  end

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

  # ========= Testing ArgumentError is raised with invalid attributes ==========

  def test_raises_an_error_if_input_is_not_string_or_integer
    assert_raises(ArgumentError) { @convertor.input = :sym }
    assert_raises(ArgumentError) { @convertor.input = [4] }
  end

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

  def test_to_decimal_is_alias_for_to_d
    convertor = ToDecimal::Convertor.new(200, 10)
    assert_equal(200, convertor.to_decimal)
  end

  # ========== Testing to_d_with raises error with invalid arguments============

  def test_to_d_with_raises_error_if_first_arg_is_not_string_or_integer
    assert_raises(ArgumentError) { @convertor.to_d_with(:sym, 5) }
    assert_raises(ArgumentError) { @convertor.to_d_with([4], 5) }
  end

  def test_to_d_with_raises_an_error_if_base_arg_is_not_an_integer_or_a_string
    assert_raises(ArgumentError) { @convertor.to_d_with('222', [5]) }
    assert_raises(ArgumentError) { @convertor.to_d_with(45, :sym) }
  end

  def test_to_d_with_raises_an_error_if_base_arg_is_greater_than_10
    assert_raises(ArgumentError) { @convertor.to_d_with(456, 12) }
  end

  def test_to_d_with_raises_an_error_if_base_arg_is_smaller_than_1
    assert_raises(ArgumentError) { @convertor.to_d_with(456, 0) }
    assert_raises(ArgumentError) { @convertor.to_d_with(456, -8) }
  end

  # ======== Testing return values of to_d_with ================================
  
  def test_to_d_with_return_decimal_value_of_number_of_base_2
    execute_test_of_to_d_with(TEST_VALUES_BASE_2)
  end

    def test_to_d_with_return_decimal_value_of_number_of_base_3
    execute_test_of_to_d_with(TEST_VALUES_BASE_3)
  end

  def test_to_d_with_return_decimal_value_of_number_of_base_4
    execute_test_of_to_d_with(TEST_VALUES_BASE_4)
  end

  def test_to_d_with_return_decimal_value_of_number_of_base_5
    execute_test_of_to_d_with(TEST_VALUES_BASE_5)
  end

  def test_to_d_with_return_decimal_value_of_number_of_base_6
    execute_test_of_to_d_with(TEST_VALUES_BASE_6)
  end

  def test_to_d_with_return_decimal_value_of_number_of_base_7
    execute_test_of_to_d_with(TEST_VALUES_BASE_7)
  end

  def test_to_d_with_return_decimal_value_of_number_of_base_8
    execute_test_of_to_d_with(TEST_VALUES_BASE_8)
  end

  def test_to_d_with_return_decimal_value_of_number_of_base_9
    execute_test_of_to_d_with(TEST_VALUES_BASE_9)
  end

  def test_to_d_with_return_decimal_value_of_number_of_base_10
    execute_test_of_to_d_with(TEST_VALUES_BASE_10)
  end


  # ========= Testing to_d class method accepts both string and integer args ===

  def test_to_d_class_method_accepts_integers_for_both_parameters
    assert_silent { ToDecimal::Convertor.to_d(101, 2) }
  end

  def test_to_d_class_method_accepts_strings_for_both_parameters
    assert_silent { ToDecimal::Convertor.to_d('101', '2') }
  end
  
  def test_to_d_class_method_accepts_mixed_strings_and_integers_as_args
    assert_silent { ToDecimal::Convertor.to_d('101', 2) }
    assert_silent { ToDecimal::Convertor.to_d(101, '2') } 
  end

  # ======== Testing to_d class method raises error with invalid parameters ====

  def test_to_d_class_method_raises_error_if_first_arg_is_not_string_or_integer
    assert_raises(ArgumentError) { ToDecimal::Convertor.to_d(:sym, 5) }
    assert_raises(ArgumentError) { ToDecimal::Convertor.to_d([4], 5) }
  end

  def test_to_d_class_method_raises_error_if_base_arg_is_not_an_integer_or_str
    assert_raises(ArgumentError) { ToDecimal::Convertor.to_d('222', [5]) }
    assert_raises(ArgumentError) { ToDecimal::Convertor.to_d(45, :sym) }
  end

  def test_to_d_class_method_raises_an_error_if_base_arg_is_greater_than_10
    assert_raises(ArgumentError) { ToDecimal::Convertor.to_d(456, 12) }
  end

  def test_to_d_class_method_raises_an_error_if_base_arg_is_smaller_than_1
    assert_raises(ArgumentError) { ToDecimal::Convertor.to_d(456, 0) }
    assert_raises(ArgumentError) { ToDecimal::Convertor.to_d(456, -8) }
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
