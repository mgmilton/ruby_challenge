require './test/test_helper'
require './lib/violation'

class ViolationTest < Minitest::Test
  def setup
    @violation = Violation.new(
      :violation_id => 1,
      :inspection_id => 4,
      :violation_category => "Animals and Pests",
      :violation_date => "2012-10-29",
      :violation_date_closed => "2012-10-29",
      :violation_type => "Rodents, not specified"
    )
  end

  def test_it_calls_instance_variables
    assert_equal 1, @violation.violation_id
    assert_equal 4, @violation.inspection_id
    assert_equal "Animals and Pests", @violation.violation_category
    assert_instance_of Time, @violation.violation_date
    assert_instance_of Time, @violation.violation_date_closed
    assert_equal "Rodents, not specified", @violation.violation_type
  end
end
