require 'rails_helper'

RSpec.describe "ballot_results/show", type: :view do
  before(:each) do
    @ballot_result = assign(:ballot_result, BallotResult.create!(
      ballot: nil,
      question_result: nil,
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
