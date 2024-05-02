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

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:score]}"
    attempt_serialized = URI.open(url).read
    @attempt_return = JSON.parse(attempt_serialized)
  end

  def hidden_field_tag(name, value = nil, options = {})
    text_field_tag(name, value, options.merge(type: :hidden))
  end
end
