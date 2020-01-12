# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rate = Rate.current
  end
end
