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
  end
end
