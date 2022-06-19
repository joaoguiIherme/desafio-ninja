class RoomsManagement
  def available?(room, start_time, end_time, meeting = 0)
    @meeting_id = meeting
    @room = room
    raise ExceptionsRules::RoomRules::RoomNotAvailabeToSchedule, 'Already exists a meeting in this room!' unless free?(
      start_time, end_time
    )
  end

  def free?(start_time, end_time)
    return true if @room.schedulings.empty?

    scheduleds_meetings = []
    @room.schedulings.each do |meet|
      next if meet.id == @meeting_id

      unless (start_time < meet.start_time && end_time <= meet.end_time) || (start_time >= meet.end_time && end_time > start_time)
        scheduleds_meetings.append(meet)
      end
    end
    scheduleds_meetings.empty?
  end
end
