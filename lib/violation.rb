require 'time'

class Violation
  attr_reader   :violation_id,
                :inspection_id,
                :violation_category,
                :violation_date,
                :violation_date_closed,
                :violation_type

  def initialize(info, total_violations= "")
    @violation_id             = info[:violation_id].to_i
    @inspection_id            = info[:inspection_id].to_i
    @violation_category       = info[:violation_category]
    @violation_date           = Time.strptime(info[:violation_date],'%Y-%m-%d')
    @violation_date_closed    = date_checker(info[:violation_date_closed])
    @violation_type           = info[:violation_type]
    @parent                   = total_violations
  end

  def date_checker(info)
    if info
      Time.strptime(info,'%Y-%m-%d')
    else
      "NA"
    end
  end
end
