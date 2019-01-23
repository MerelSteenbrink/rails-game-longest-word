require "open-uri"

class GamesController < ApplicationController

  	def generate_grid(grid_size)
	  # TODO: generate random grid of letters
	  voals = %w(A E I O U Y)
	  alfa = ('A'..'Z').to_a
	  grid = []
	  (grid_size - 1).times { grid << alfa.sample }
	  grid << voals.sample
	  grid
	end

	def check_grid(user_input, random_letters)
	  letters_to_check = user_input.upcase.split("")
	  bollie = true
	  random_letters = random_letters.split(" ")
	  letters_to_check.each do |letter|
	    # index = random_letters.index(letter)
	    if random_letters.index(letter).nil?
	      bollie = false
	    else
	      random_letters.delete_at(random_letters.index(letter))
	  return bollie
	    end
	end
 	end



	def english_word?(word)
	    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
	    json = JSON.parse(response.read)
	    json['found']
	end


	  def score
	  	@word = params[:word]
	  	grid = params[:letters]
	  	 # TODO:
	  	 # Can you make it with the grid?
	  	if !check_grid(@word, grid)
	  		@answer = "Sorry, you cannot make #{@word} with these letters"
	  	else
	  	# Is it an English word?
	  		if !english_word?(@word)
	  			@answer = "Sorry, #{@word} is not an English word."
	  		else 
		  	 # Calculate score
	  			@answer = "BOOM! Nice, your score is #{@word.length * 3}"
	  		end
	  	end
	  	@answer
	  end

	def new
	  	@letters = generate_grid(7)
	end

end