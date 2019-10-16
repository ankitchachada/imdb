class MoviesController < ApplicationController
  include Pagy::Backend
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :authorize, except: [:index,:show]
  # GET /movies
  # GET /movies.json
  def index
    @pagy,@movies = pagy(Movie.includes(:genre), items: 2)
    @movies_id = @movies.pluck(:id)
  end

  def dashboard
    @pagy,@movies = pagy(Movie.includes(:genre), items: 2)
    @movies_id = @movies.pluck(:id)
  end
  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to  dashboard_path , notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to dashboard_path , notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path , notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :rating, :genre_id)
    end

    def authorize
      unless current_user.role == "admin"
        redirect_to root_path, notice: 'Please contact Admin'
      end
    end
end
