# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    let!(:rate) { create(:rate) }
    let(:current_rate) { Rate.current }

    it 'has success response' do
      expect(response).to have_http_status(:success)
    end

    context 'with different formats' do
      it 'returns index template' do
        expect(response).to render_template('index')
      end

      it 'returns current rate json' do
        get :index, format: 'json'
        expect(response.body).to eq current_rate.to_json
      end
    end

    it 'returns current rate' do
      expect(assigns[:rate]).to eq([current_rate])
    end
  end
end
