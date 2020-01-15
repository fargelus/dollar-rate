# frozen_string_literal: true

class RatesController < ApplicationController
  def new
    params = session[:rate]
    @rate = Rate.new(params)
  end

  def create
    @rate = Rate.new(rate_params)
    if @rate.save
      session[:rate] = rate_params.to_h
      ChangeRateNotifier.call(@rate.rate)
      redirect_to root_path, notice: 'Курс зафиксирован'
    else
      render 'new'
    end
  end

  private

  def rate_params
    params.require(:rate).permit(
      :rate,
      :force_date
    )
  end
end
