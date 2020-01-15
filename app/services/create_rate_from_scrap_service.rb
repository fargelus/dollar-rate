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

    is_valid = Rate.create!(rate: @actual_rate).valid?
    ChangeRateNotifier.call(@actual_rate)
    is_valid
  end
end
