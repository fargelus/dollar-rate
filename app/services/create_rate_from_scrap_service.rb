# frozen_string_literal: true

# Service creates dollar to rubble rate db record.
# Returns true if record successfully creates
# Otherwise false

class CreateRateFromScrapService < Callable
  def initialize
    @data = FetchRateDataService.call
    @actual_rate = @data.dig('Valute', 'USD', 'Value')
  end

  def call
    return false unless @actual_rate

    new_rate = Rate.create!(rate: @actual_rate)
    has_force_date = GetRateWithFutureForceDate.call
    ChangeRateNotifier.call(@actual_rate) unless has_force_date
    new_rate.valid?
  end
end
