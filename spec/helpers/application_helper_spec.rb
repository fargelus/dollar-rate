# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '.today' do
    it 'returns current formatted time' do
      expect(today).to eql Date.today.strftime('%e/%m/%Y')
    end
  end
end
