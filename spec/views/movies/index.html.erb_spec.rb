require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    @genre = create(:genre)
    assign(:movies, [
      Movie.create!(
        :title => "Title",
        :description => "MyText",
        :genre_id => @genre.id
      ),
      Movie.create!(
        :title => "Title",
        :description => "MyText",
        :genre_id => @genre.id
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
