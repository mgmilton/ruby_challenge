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
      new_violation = Violation.new(violation)
      @violations[new_violation.violation_id] = new_violation
    end

  end

  def types
    @violations.values.map do |violation|
        violation.violation_type
      end.uniq
  end

  def count(type)
    @violations.values.select {|violation| violation.violation_type == type}.count
  end

  def sorted(type)
    @violations.values.select {|violation| violation.violation_type == type}.sort_by {|violation| violation.violation_date}
  end

  def printer
    types.map do |type|
      puts "Violation Type #{type}"
      puts "----------------------------"
      puts "Total Violations: #{count(type)}"
      puts "Earliest Violation: #{sorted(type).first.violation_date}"
      puts "Latest Violation: #{sorted(type).last.violation_date}"
      puts "                             "
    end
  end
end
