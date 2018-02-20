require './test/test_helper'
require './lib/total_violations'

class TotalViolationsTest < Minitest::Test

  def setup
    @violations = TotalViolations.new
  end

  def test_types_returns_an_array_of_violation_types
    assert_equal Array, @violations.types.class
    assert_equal 43, @violations.types.count
  end

  def test_count_returns_count_of_violations_by_type
    assert_equal 106, @violations.count(@violations.types[0])
    assert_equal 74, @violations.count(@violations.types[1])
    assert_equal 41, @violations.count(@violations.types[2])
  end

  def test_sorted_returns_array_of_violations_by_type
    assert_equal Array, @violations.sorted(@violations.types[0]).class
    assert_equal 204851, @violations.sorted(@violations.types[0]).first.violation_id
    assert_equal 229997, @violations.sorted(@violations.types[0]).last.violation_id
  end
end
