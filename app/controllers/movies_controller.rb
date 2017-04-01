class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
       redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
       redirect_to movies_path, notice: "Update success!"
    else
      render: edit
    end 

  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, alert: "Movie deleted!"
  end

  private

  def movie_params
    params.require(:movies).permit(:title, :description)
  end
  end
