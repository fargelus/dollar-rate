# frozen_string_literal: true

class RateSeed
  def initialize
    unless CreateRateFromScrapService.call
      puts "Can't create db record. Sorry):"
    end
  end
end

RateSeed.new
