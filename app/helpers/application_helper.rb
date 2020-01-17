# frozen_string_literal: true

module ApplicationHelper
  def today
    Date.today.strftime('%e/%m/%Y')
  end
end
