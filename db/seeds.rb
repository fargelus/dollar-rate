# frozen_string_literal: true

require 'net/http'

class RateSeed
  RATE_URI = 'https://www.cbr-xml-daily.ru/daily_json.js'

  def initialize
    @data = {}
    read_data
    seed
  end

  def read_data
    uri = URI(RATE_URI)
    response = Net::HTTP.get(uri)
    @data = JSON.parse(response)
  end

  private

  def seed
    rate = @data.dig('Valute', 'USD', 'Value')
    Rate.create!(rate: rate) && return if rate
    puts "Can't create db record from nil value. Sorry):"
  end
end

RateSeed.new
