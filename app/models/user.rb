class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ratings, dependent: :destroy

  def find_score(movie_id)
  	ratings.where(movie_id: movie_id).first.try(:rating)
  end
end
