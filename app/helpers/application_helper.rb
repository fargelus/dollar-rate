# frozen_string_literal: true

module ApplicationHelper
  def now
    Date.today.strftime('%e/%m/%Y')
  end
end
