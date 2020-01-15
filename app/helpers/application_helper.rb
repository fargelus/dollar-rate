# frozen_string_literal: true

module ApplicationHelper
  def now
    Date.today.strftime('%e/%m/%Y')
  end

  def local_datetime(time = Time.now)
    time.strftime('%Y-%m-%eT%H:%M')
  end

  def freeze_rate?(rate)
    rate.force_date&.future?
  end
end
