# frozen_string_literal: true

class GetRateWithFutureForceDate < Callable
  def call
    Rate.where('force_date > ?', Time.now)
        .order('force_date DESC')
        .first
  end
end
