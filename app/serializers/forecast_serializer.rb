class ForecastSerializer
  def self.format_data(current, daily, hourly)
    {
      "data": {
        "id": current.id,
        "type": 'forecast',
        "attributes": {
          "current_weather": {
            "datetime": current.datetime,
            "sunrise": current.sunrise,
            "sunset": current.sunset,
            "temperature": current.temperature,
            "feels_like": current.feels_like,
            "humidity": current.humidity,
            "uvi": current.uvi,
            "visibility": current.visibility,
            "conditions": current.conditions,
            "icon": current.icon
          },
          "daily_weather": map_daily(daily),
          "hourly_weather": map_hourly(hourly)
        }
      }
    }
  end

  def self.map_daily(daily)
    daily.map do |day|
      {
        "date": day.date,
        "sunrise": day.sunrise,
        "sunset": day.sunset,
        "max_temp": day.max_temp,
        "min_temp": day.min_temp,
        "conditions": day.conditions,
        "icon": day.icon
      }
    end
  end

  def self.map_hourly(hourly)
    hourly.map do |hour|
      {
        "time": hour.time,
        "temperature": hour.temperature,
        "conditions": hour.conditions,
        "icon": hour.icon
      }
    end
  end
end
