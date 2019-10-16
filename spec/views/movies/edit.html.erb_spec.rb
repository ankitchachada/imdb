require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @genre = create(:genre)
    @movie = assign(:movie, Movie.create!(
      :title => "Lord of the Rings",
      :description => "This is fantasy movie",
      :genre_id => @genre.id
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "textarea[name=?]", "movie[description]"

      assert_select "select[name=?]", "movie[genre_id]"
    end
  end
end
