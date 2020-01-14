# frozen_string_literal: true

# Fetch last exchange rate data

require 'net/http'

class FetchRateDataService < Callable
  RATE_URI = 'https://www.cbr-xml-daily.ru/daily_json.js'

  def call
    uri = URI(RATE_URI)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
