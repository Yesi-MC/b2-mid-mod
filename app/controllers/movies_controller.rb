class MoviesController < ApplicationController 

  def show
    @movie = Movie.find(params[:id])
    @actor = Actor.find_by(name: params["Actor Search"])
  end
end