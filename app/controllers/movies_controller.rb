class MoviesController < ApplicationController
  def new
     @list = List.find(params[:list_id])
     @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    byebug
    @list = List.find(params[:list_id])
    # @movie.list = @list
    @movie.bookmarks.new(list: @list, comment: params[:other][:comment])
    # same as below
    # @bookmark = Bookmark.new(movie:@movie, list: @list)
    if @movie.save
     redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @list = @movie.list
    @movie.destroy

    redirect_to list_path(@list)
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :rating, photos: [])
  end
end
