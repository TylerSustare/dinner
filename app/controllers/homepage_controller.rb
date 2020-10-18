# frozen_string_literal: true

# Homepage Controller is a homepage controller
class HomepageController < ApplicationController
  def index
    @greeting = 'why hello there'
  end

  def tester
    @greeting = 'other page too'
  end
end
