class Movie < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
	
	belongs_to :genre
	
	has_many :ratings
	
	delegate :name, to: :genre,  prefix: :genre
	
	
	def avg_rating
		ratings.average(:rating) ? ratings.average(:rating) : 0
	end
end
