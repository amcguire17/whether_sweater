class ForecastSerializer
  def self.format_data(id, current, daily, hourly)
    {
      "data": {
        "id": id,
        "type": 'forecast',
        "attributes": {
          "current_weather": {
            "datetime": Time.at(current[:dt]).to_s,
            "sunrise": Time.at(current[:sunrise]).to_s,
            "sunset": Time.at(current[:sunset]).to_s,
            "temperature": current[:temp],
            "feels_like": current[:feels_like],
            "humidity": current[:humidity],
            "uvi": current[:uvi],
            "visibility": current[:visibility],
            "conditions": current[:weather].first[:description],
            "icon": current[:weather].first[:icon],
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
        "date": Time.at(day[:dt]).to_s[0..9],
        "sunrise": Time.at(day[:sunrise]).to_s,
        "sunset": Time.at(day[:sunset]).to_s,
        "max_temp": day[:temp][:max],
        "min_temp": day[:temp][:min],
        "conditions": day[:weather].first[:description],
        "icon": day[:weather].first[:icon]
      }
    end
  end
  def self.map_hourly(hourly)
    hourly.map do |hour|
      {
        "time": Time.at(hour[:dt]).to_s[11..18],
        "temperature": hour[:temp],
        "conditions": hour[:weather].first[:description],
        "icon": hour[:weather].first[:icon]
      }
    end
  end
end
