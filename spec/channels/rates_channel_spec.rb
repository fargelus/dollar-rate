# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatesChannel, type: :channel do
  describe '.subscribed' do
    it 'successfully subscribed' do
      subscribe
      expect(subscription).to be_confirmed
    end
  end
end
