require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :title => "Harry Potter",
      :description => "description",
      :genre_id => 1
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "textarea[name=?]", "movie[description]"

      assert_select "select[name=?]", "movie[genre_id]"
    end
  end
end
