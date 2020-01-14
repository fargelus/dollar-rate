# frozen_string_literal: true

# Service creates dollar to rubble rate db record.
# Returns true if record successfully creates
# Otherwise false

class RateRecordCreator < Callable
  def initialize
    @data = FetchRateDataService.call
    @actual_rate = @data.dig('Valute', 'USD', 'Value')
  end

  def call
    return false unless @actual_rate

    Rate.create!(rate: @actual_rate).valid?
  end
end
