# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :rate, presence: true
  validates_with ForceDateValidator
  before_save :skip_all_force_date, if: :force_date

  scope :current, lambda {
    rate = GetRateWithFutureForceDate.call
    rate.nil? ? Rate.last_without_force_date : rate
  }

  def self.last_without_force_date
    where(force_date: nil).last
  end

  def skip_all_force_date
    self.class.update_all(force_date: nil)
  end
end
