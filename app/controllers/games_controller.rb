class GamesController < ApplicationController
  def new
    source = ('A'..'Z').to_a
    key = ''
    10.times { key += source[rand(source.size)].to_s }
    @letters = key.split('')
  end

  def score
    console
    raise
  end
end
