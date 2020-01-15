# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :rate, presence: true
  validates_with ForceDateValidator

  scope :current, lambda {
    rate = GetRateWithFutureForceDate.call
    rate.nil? ? Rate.last_without_force_date : rate
  }

  def self.last_without_force_date
    where(force_date: nil).last
  end
end
