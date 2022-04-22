require 'rails_helper'

RSpec.describe "ballots/index", type: :view do
  before(:each) do
    assign(:ballots, [
      Ballot.create!(
        user: nil,
        title: "Title",
        description: "MyText",
        URL: "MyText",
        ballot_type: "Ballot Type",
        weighted_voting: false,
        show_results: false
      ),
      Ballot.create!(
        user: nil,
        title: "Title",
        description: "MyText",
        URL: "MyText",
        ballot_type: "Ballot Type",
        weighted_voting: false,
        show_results: false
      )
    ])
  end

  it "renders a list of ballots" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Ballot Type".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
