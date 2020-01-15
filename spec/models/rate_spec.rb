# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rate, type: :model do
  let!(:rate) { create(:rate) }
  let!(:nil_rate) { create(:rate, force_date: nil) }

  describe 'validations' do
    it { should validate_presence_of :rate }

    it 'should not valid if force_date in past' do
      rate.force_date = 1.day.ago
      expect(rate).to_not be_valid
    end
  end

  context 'scopes' do
    describe '.last_without_force_date' do
      it 'rate exists' do
        result = Rate.last_without_force_date
        expect(result).to eq nil_rate
      end
    end

    describe '.current' do
      it 'returns current rate' do
        result = Rate.current
        expect(result).to eq rate
      end
    end
  end
end
