require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    random_grid = []
    while random_grid.size < 11
      random_grid << ('A'..'Z').to_a.sample
    end
      @letters = random_grid
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:score]}"
    attempt_serialized = URI.open(url).read
    attempt_return = JSON.parse(attempt_serialized)
  end
end
