require 'rails_helper'

RSpec.describe "ballot_results/index", type: :view do
  before(:each) do
    assign(:ballot_results, [
      BallotResult.create!(
        ballot: nil,
        question_result: nil,
        content: "MyText"
      ),
      BallotResult.create!(
        ballot: nil,
        question_result: nil,
        content: "MyText"
      )
    ])
  end

  it "renders a list of ballot_results" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
