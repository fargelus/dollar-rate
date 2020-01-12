# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rate = Rate.last
  end
end
