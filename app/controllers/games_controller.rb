require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    source = ('A'..'Z').to_a
    key = ''
    10.times { key += source[rand(source.size)].to_s }
    @letters = key.split('')
  end

  def score
    console
    end_time = Time.now.to_i
    time_spent = end_time - params[:start].to_i
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = open(url).read
    word_checked = JSON.parse(word_serialized)
    if word_checked["found"] == false
      @answer = { time: time_spent, score: 0, message: "This is not an english word" }
    elsif params[:word].upcase.split("").all? { |letter| params[:word].upcase.split("").count(letter) <= params[:grid].count(letter) }
      @answer = { time: time_spent, score: (params[:word].length * 100 - (time_spent) * 20), message: "Well done" }

    else @answer = { time: time_spent, score: 0, message: "It's not in the grid" }

    end
    # raise
  end
end
