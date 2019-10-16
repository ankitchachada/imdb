require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @genre = create(:genre)
    @movie = assign(:movie, Movie.create!(
      :title => "Title",
      :description => "MyText",
      :genre_id => @genre.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
