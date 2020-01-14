# frozen_string_literal: true

class RateSeed
  def initialize
    puts "Can't create db record. Sorry):" unless RateRecordCreator.call
  end
end

RateSeed.new
