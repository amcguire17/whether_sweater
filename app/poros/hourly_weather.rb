class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(info)
    @time = Time.at(info[:dt]).to_s[11..18]
    @temperature = info[:temp]
    @conditions = info[:weather].first[:description]
    @icon = info[:weather].first[:icon]
  end
end
