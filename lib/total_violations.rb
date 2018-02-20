require "csv"
require_relative "violation"

class TotalViolations

  def initialize
    @violations = {}
    violations_creator
  end


  def violations_creator
    violations = CSV.open("./data/Violations-2012.csv", headers: true, header_converters: :symbol)
    violations.each do |violation|
      new_violation = Violation.new(violation, self)
      @violations[new_violation.violation_id] = new_violation
    end
    binding.pry
  end

end
