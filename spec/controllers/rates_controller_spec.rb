# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatesController, type: :controller do
  describe 'GET #new' do
    it 'successfully responsed' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:rate) { build(:rate) }
    let(:post_object) do
      {
        rate: {
          rate: rate.rate,
          force_date: rate.force_date
        }
      }
    end

    it 'creates new rate' do
      expect { post :create, params: post_object }.to change { Rate.count }.by(1)
    end

    it 'renders new template when save failed' do
      post_object[:rate][:rate] = nil
      post :create, params: post_object
      expect(response).to render_template(:new)
    end
  end
end
