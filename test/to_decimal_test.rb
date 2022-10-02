require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../lib/to_decimal"

class ToDecimalTest < Minitest::Test
  def test_base_object_can_be_initialized_with_correct_argument
    (2..36).to_a.each do |valid_base|
      assert_silent { ToDecimal::Base.new(valid_base) }
    end
  end

  def test_base_object_initialisation_raises_if_incorrect_argument
    [1, 37, "10", "a", :a].each do |invalid_base|
      assert_raises(ArgumentError) { ToDecimal::Base.new(invalid_base) }
    end
  end

  def test_raises_wrong_input_base_error_if_input_is_not_of_the_correct_base
    base2 = ToDecimal::Base.new(2)
    assert_raises(ToDecimal::WrongInputBaseError) { base2[2] }
    assert_raises(ToDecimal::WrongInputBaseError) { base2["2"] }
    assert_raises(ToDecimal::WrongInputBaseError) { base2["02"] }

    base10 = ToDecimal::Base.new(10)
    assert_raises(ToDecimal::WrongInputBaseError) { base10["a"] }
    assert_raises(ToDecimal::WrongInputBaseError) { base10["0a"] }
    assert_raises(ToDecimal::WrongInputBaseError) { base10["A"] }

    base35 = ToDecimal::Base.new(35)
    assert_raises(ToDecimal::WrongInputBaseError) { base35["z"] }
    assert_raises(ToDecimal::WrongInputBaseError) { base35["0z"] }
  end

  def test_returns_correct_value_as_integer
    base2 = ToDecimal::Base.new(2)
    assert_equal 2, base2[10]
    assert_equal 2, base2["10"]
    assert_equal 2, base2["010"]

    base36 = ToDecimal::Base.new(36)
    assert_equal 1, base36[1]
    assert_equal 146, base36["42"]
  end

  def test_is_case_insensitive
    base16 = ToDecimal::Base.new(16)
    assert_equal 15, base16["f"]
    assert_equal 15, base16["F"]

    assert_equal 255, base16["ff"]
    assert_equal 255, base16["FF"]
  end

  def test_handles_leading_zeros_in_strings
    base8 = ToDecimal::Base.new(8)
    assert_equal 34, base8["42"]
    assert_equal 34, base8["042"]
    assert_equal 34, base8["0000042"]
  end
end
