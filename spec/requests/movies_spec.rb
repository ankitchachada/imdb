require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /movies" do
    it "get the list of all movies" do
      get movies_path
      expect(response).to have_http_status(200)
    end
  end
end
