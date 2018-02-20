require './test/test_helper'
require './lib/total_violation'

class TotalViolationsTest < Minitest::Test

  def setup
    @violations = TotalViolations.new
  end

end
