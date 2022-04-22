require 'rails_helper'

RSpec.describe "ballot_results/new", type: :view do
  before(:each) do
    assign(:ballot_result, BallotResult.new(
      ballot: nil,
      question_result: nil,
      content: "MyText"
    ))
  end

  it "renders new ballot_result form" do
    render

    assert_select "form[action=?][method=?]", ballot_results_path, "post" do

      assert_select "input[name=?]", "ballot_result[ballot_id]"

      assert_select "input[name=?]", "ballot_result[question_result_id]"

      assert_select "textarea[name=?]", "ballot_result[content]"
    end
  end
end
