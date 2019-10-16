module MoviesHelper
	include Pagy::Frontend
	def score(movie_id)
		current_user.find_score(movie_id)
	end

	def average_rating(movie)
		movie.avg_rating
	end
end
