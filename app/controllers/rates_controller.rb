# frozen_string_literal: true

class RatesController < ApplicationController
  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(rate_params)
    if @rate.save
      redirect_to root_path, notice: 'Курс зафиксирован'
    else
      render 'edit'
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
