# frozen_string_literal: true

module ApplicationHelper
  def now
    Time.now.strftime('%e/%m/%Y')
  end

  def rubbles(value)
    number_to_currency(value, unit: ' ₽', separator: ',', format: '%n%u')
  end
end
