require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/to_decimal'

class GutilsConversionTest < Minitest::Test
  # ======== Setup =============================================================
  def setup
    @convertor = Gutils::Conversion.new
  end

  # ======== Testing initialization process ====================================

  def test_initialization_without_argument_has_default_input_and_base
    assert_equal(0, @convertor.input_number)
    assert_equal(10, @convertor.base_format)
  end

  def test_initialization_with_arguments_has_input_and_base
    @new_convertor = Gutils::Conversion.new(202, 8)
    assert_equal(202, @new_convertor.input_number)
    assert_equal(8, @new_convertor.base_format)
  end

  def test_initialization_accepts_also_string_as_input_number
    @new_convertor = Gutils::Conversion.new('3098')
    assert_equal(3098, @new_convertor.input_number)
  end

  # ======== Testing accessing and modifying attributes ========================

  def test_input_number_can_be_updated
    @convertor.input = 10
    assert_equal(10, @convertor.input_number)
    @convertor.input = 20
    assert_equal(20, @convertor.input_number)
  end

  def test_input_number_can_also_be_updated_with_a_string
    @convertor.input = '202'
    assert_equal(202, @convertor.input_number)
  end

  def test_base_format_can_be_updated
    @convertor.base = 2
    assert_equal(2, @convertor.base_format)
    @convertor.base = 8
    assert_equal(8, @convertor.base_format)
  end

  def test_reset_set_decimal_integer_to_zero
    @convertor.reset
    assert_equal(0, @convertor.decimal_integer)
  end

  # ========= Testing ArgumentError is raised with invalid arguments ===========

  def test_raises_an_error_if_input_number_is_not_string_or_integer
    assert_raises(ArgumentError) { @convertor.input = :sym }
    assert_raises(ArgumentError) { @convertor.input = [4] }
  end

  def test_raises_an_error_if_base_arg_is_not_an_integer
    assert_raises(ArgumentError) { @convertor.base = "3" }
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
    @convertor.base = 2
    @convertor.input = 101
    assert_equal(5, @convertor.to_d)
    @convertor.input = 100000000
    assert_equal(256, @convertor.to_d)
    @convertor.input = "101111010"
    assert_equal(378, @convertor.to_d)
  end

  def test_to_d_returns_decimal_value_of_number_of_base_3
    @convertor.base = 3
    @convertor.input = 1012
    assert_equal(32, @convertor.to_d)
    @convertor.input = "12111011"
    assert_equal(4000, @convertor.to_d)
    @convertor.input = "101"
    assert_equal(10, @convertor.to_d)
  end

  # ========= Testing aliased to_decimal instance method =======================

  def test_to_decimal_is_alias_for_to_d
    convertor = Gutils::Conversion.new(200, 10)
    assert_equal(200, convertor.to_decimal)
  end

  # ========= Testing to_d class method ========================================

  def test_to_d_class_method_converts_also_string_representation_of_integers
    assert_equal(5, Gutils::Conversion.to_d('101', 2))
    assert_equal(241, Gutils::Conversion.to_d('11110001', 2))
    assert_equal(4, Gutils::Conversion.to_d('4', 8))
    assert_equal(10, Gutils::Conversion.to_d('12', 8))
  end

  def test_to_d_class_method_returns_the_decimal_version_of_a_number_of_base_8
    assert_equal(4, Gutils::Conversion.to_d(4, 8))
    assert_equal(10, Gutils::Conversion.to_d(12, 8))
  end

  def test_to_d_class_method_returns_the_decimal_version_of_a_number_of_base_3
    assert_equal(2, Gutils::Conversion.to_d(2, 3))
    assert_equal(80, Gutils::Conversion.to_d(2222, 3))
  end

  def test_to_d_class_method_returns_the_decimal_version_of_a_number_of_base_2
    assert_equal(378, Gutils::Conversion.to_d("101111010", 2))
    assert_equal(5, Gutils::Conversion.to_d(101, 2))
  end

  def test_to_d_class_method_raises_error_if_first_arg_is_not_string_or_integer
    assert_raises(ArgumentError) { Gutils::Conversion.to_d(:sym, 5) }
    assert_raises(ArgumentError) { Gutils::Conversion.to_d([4], 5) }
  end

  def test_to_d_class_method_raises_an_error_if_base_arg_is_not_an_integer
    assert_raises(ArgumentError) { Gutils::Conversion.to_d('222', '5') }
    assert_raises(ArgumentError) { Gutils::Conversion.to_d(45, :sym) }
  end

  def test_to_d_class_method_raises_an_error_if_base_arg_is_greater_than_10
    assert_raises(ArgumentError) { Gutils::Conversion.to_d(456, 12) }
  end

  def test_to_d_class_method_raises_an_error_if_base_arg_is_smaller_than_1
    assert_raises(ArgumentError) { Gutils::Conversion.to_d(456, 0) }
    assert_raises(ArgumentError) { Gutils::Conversion.to_d(456, -8) }
  end

  # ========== Testing to_d_with instance method ===============================

  def test_to_d_with_returns_the_decimal_version_of_a_number_of_base_8
    assert_equal(4, @convertor.to_d_with(4, 8))
    assert_equal(14, @convertor.to_d_with(16, 8))
  end

  def test_to_d_with_returns_the_decimal_version_of_a_number_of_base_3
    assert_equal(2, @convertor.to_d_with(2, 3))
    assert_equal(80, @convertor.to_d_with(2222, 3))
  end

  def test_to_d_with_raises_error_if_first_arg_is_not_string_or_integer
    assert_raises(ArgumentError) { @convertor.to_d_with(:sym, 5) }
    assert_raises(ArgumentError) { @convertor.to_d_with([4], 5) }
  end

  def test_to_d_with_raises_an_error_if_base_arg_is_not_an_integer
    assert_raises(ArgumentError) { @convertor.to_d_with('222', '5') }
    assert_raises(ArgumentError) { @convertor.to_d_with(45, :sym) }
  end

  def test_to_d_with_raises_an_error_if_base_arg_is_greater_than_10
    assert_raises(ArgumentError) { @convertor.to_d_with(456, 12) }
  end

  def test_to_d_with_raises_an_error_if_base_arg_is_smaller_than_1
    assert_raises(ArgumentError) { @convertor.to_d_with(456, 0) }
    assert_raises(ArgumentError) { @convertor.to_d_with(456, -8) }
  end

  # ============ Teardown ======================================================

  def teardown
    @convertor.reset
  end
end
