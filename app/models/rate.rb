# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :rate, presence: true
end
