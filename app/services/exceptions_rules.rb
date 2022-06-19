module ExceptionsRules
  module TimeRules
    class InvalidHours < StandardError
    end

    class NotComercialTime < StandardError
    end

    class NotAllowToScheduleInThePast < StandardError
    end
  end

  module RoomRules
    class RoomNotAvailabeToSchedule < StandardError
    end
  end
end
