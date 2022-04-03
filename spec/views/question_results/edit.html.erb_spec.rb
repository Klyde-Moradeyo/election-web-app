require 'rails_helper'

RSpec.describe "question_results/edit", type: :view do
  before(:each) do
    @question_result = assign(:question_result, QuestionResult.create!(
      question: nil,
      ballot: nil,
      content: "MyText"
    ))
  end

  it "renders the edit question_result form" do
    render

    assert_select "form[action=?][method=?]", question_result_path(@question_result), "post" do

      assert_select "input[name=?]", "question_result[question_id]"

      assert_select "input[name=?]", "question_result[ballot_id]"

      assert_select "textarea[name=?]", "question_result[content]"
    end
  end
end
