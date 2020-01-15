# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rate = Rate.current
    make_response
  end

  private

  def make_response
    respond_to do |format|
      format.json { render json: @rate }
      format.html
    end
  end
end
