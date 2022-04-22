require 'rails_helper'

RSpec.describe "ballots/show", type: :view do
  before(:each) do
    @ballot = assign(:ballot, Ballot.create!(
      user: nil,
      title: "Title",
      description: "MyText",
      URL: "MyText",
      ballot_type: "Ballot Type",
      weighted_voting: false,
      show_results: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Ballot Type/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
