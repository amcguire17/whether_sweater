# frozen_string_literal: true

class ApiService
  def self.format_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
