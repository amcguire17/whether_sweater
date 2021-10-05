# frozen_string_literal: true

class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(info)
    @date = Time.at(info[:dt]).to_s[0..9]
    @sunrise = Time.at(info[:sunrise])
    @sunset = Time.at(info[:sunset])
    @max_temp = info[:temp][:max]
    @min_temp = info[:temp][:min]
    @conditions = info[:weather].first[:description]
    @icon = info[:weather].first[:icon]
  end
end
