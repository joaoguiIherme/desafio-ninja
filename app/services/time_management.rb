class TimeManagement
  def comercial?(start_time, end_time)
    start = Time.zone.parse(start_time)
    ends = Time.zone.parse(end_time)

    raise ExceptionsRules::TimeRules::InvalidHours.new('Invalid combination of start and end of the meeting to schedule!') if ends < start
    raise ExceptionsRules::TimeRules::NotComercialTime.new('Only availabe in commercial time!') unless comercial_days?(start,
                                                                              ends) && comercial_hours?(start, ends)
    raise ExceptionsRules::TimeRules::NotAllowToScheduleInThePast.new('You can\'t schedule in the past!') unless available_time?(start)
  end

  def comercial_days?(start, ends)
    return false if start.saturday? || start.monday? || ends.saturday? || ends.saturday?

    true
  end

  def comercial_hours?(start, ends)
    return false if start.hour < 9 || start.hour > 18
    return false if ends.hour < 9 || ends.hour > 18

    true
  end

  def available_time?(start)
    start >= Time.current
  end
end
