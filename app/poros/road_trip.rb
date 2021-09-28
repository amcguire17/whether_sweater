class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time, :temperature, :conditions

  def initialize(origin, destination, weather_info, directions_info)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(directions_info[:route][:formattedTime], directions_info[:info][:messages])
    @temperature = weather_info.temperature unless !directions_info[:info][:messages].empty?
    @conditions = weather_info.conditions unless !directions_info[:info][:messages].empty?
  end

  def format_time(time, message)
    if message.empty?
      array = time.split(":")
      "#{array[0]} hours, #{array[1]} minutes"
    else
      'impossible'
    end
  end
end
