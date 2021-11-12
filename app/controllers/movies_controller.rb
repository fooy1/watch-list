class MoviesController < ApplicationController
before_action :set_movie, only: %i[ show]

  def index
    @movies = Movie.all
  end

  def show
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
