class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :temperature, :conditions

  def initialize(origin, destination, weather_info, directions_info)
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(directions_info[:route][:formattedTime])
    @temperature = find_temp(weather_info, directions_info[:route][:time])
    @conditions = find_conditions(weather_info, directions_info[:route][:time])
  end

  def format_time(time)
    if !time.nil?
      time.split(":")
      "#{time[0]} hours, #{time[1]} minutes"
    else
      'impossible'
    end
  end

  def find_weather(weather_info, time)
    hours = time / 3600
    weather_info[:hourly][hours]
  end

  def find_temp(weather_info, time)
    if !time.nil?
      eta_weather = find_weather(weather_info, time)
      eta_weather[:temp]
    end
  end

  def find_conditions(weather_info, time)
    if !time.nil?
      eta_weather = find_weather(weather_info, time)
      eta_weather[:weather].first[:description]
    end
  end
end
