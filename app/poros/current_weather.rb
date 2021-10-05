# frozen_string_literal: true

class CurrentWeather
  attr_reader :id, :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions,
              :icon

  def initialize(info)
    @id = nil
    @datetime = Time.at(info[:dt])
    @sunrise = Time.at(info[:sunrise])
    @sunset = Time.at(info[:sunset])
    @temperature = info[:temp]
    @feels_like = info[:feels_like]
    @humidity = info[:humidity]
    @uvi = info[:uvi]
    @visibility = info[:visibility]
    @conditions = info[:weather].first[:description]
    @icon = info[:weather].first[:icon]
  end
end
