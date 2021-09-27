class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time, :temperature, :conditions

  def initialize(origin, destination, weather_info, directions_info)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(directions_info[:route][:formattedTime])
    @temperature = weather_info.temperature unless directions_info[:route][:formattedTime].nil?
    @conditions = weather_info.conditions unless directions_info[:route][:formattedTime].nil?
  end

  def format_time(time)
    if !time.nil?
      array = time.split(":")
      "#{array[0]} hours, #{array[1]} minutes"
    else
      'impossible'
    end
  end
end
