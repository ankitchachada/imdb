json.extract! movie, :id, :title, :description, :genre_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
