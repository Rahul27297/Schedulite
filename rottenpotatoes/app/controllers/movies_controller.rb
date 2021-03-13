class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    @classdetail = Classdetail.find_by(number: @movie.course_num)  
  end

  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    puts "*******the id is............... #{params} **************"   
    puts "*******the id is............... #{id} **************"    
    @movie = Movie.find params[:id]  
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def director
    id = params[:id]
    @movie = Movie.find(id)
    @director = @movie.director
    if @director.blank?
      flash[:warning] = "'#{@movie.title}' has no director info"
      redirect_to movies_path
    end
    @movies = Movie.with_director(@director)
  end
  
  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :director, :release_date)
  end
end
