# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :rate, presence: true
  validates_with ForceDateValidator
  before_save :left_one_with_force_date, if: :force_date

  def self.current
    GetRateWithFutureForceDate.call || Rate.last_without_force_date
  end

  def self.last_without_force_date
    where(force_date: nil).last
  end

  def left_one_with_force_date
    self.class.where.not(force_date: nil).destroy_all
  end
end
