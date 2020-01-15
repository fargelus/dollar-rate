# frozen_string_literal: true

class GetRateWithFutureForceDate < Callable
  def call
    Rate.where('force_date > ?', Time.now)
        .order('force_date ASC')
        .first
  end
end
