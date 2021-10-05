# frozen_string_literal: true

class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(info)
    @time = Time.at(info[:dt]).to_s[11..18] unless info[:dt].nil?
    @temperature = info[:temp] unless info[:temp].nil?
    @conditions = info[:weather].first[:description] unless info[:weather].nil?
    @icon = info[:weather].first[:icon] unless info[:weather].nil?
  end
end
