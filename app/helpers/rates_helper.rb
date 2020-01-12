# frozen_string_literal: true

module RatesHelper
  def local_datetime
    Time.now.strftime('%Y-%m-%eT%H:%m')
  end
end
