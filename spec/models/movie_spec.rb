require 'rails_helper'

RSpec.describe Movie, type: :model do
    subject { described_class.new(movie: "some_movie", description: "test", genre_id: 1) }
end
