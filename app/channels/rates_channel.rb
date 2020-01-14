# frozen_string_literal: true

class RatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rate_channel'
  end
end
