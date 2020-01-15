# frozen_string_literal: true

class ChangeRateNotifier < Callable
  def initialize(rate)
    @rate = rate
  end

  def call
    RatesChannel.broadcast_to(
      'rates_channel',
      rate: @rate
    )
  end
end
