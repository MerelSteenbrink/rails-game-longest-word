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

  def new
  	@letters = generate_grid(7)
  end

  def score
  end
end
