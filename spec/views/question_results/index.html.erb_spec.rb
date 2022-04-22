require 'rails_helper'

RSpec.describe "question_results/index", type: :view do
  before(:each) do
    assign(:question_results, [
      QuestionResult.create!(
        question: nil,
        ballot: nil,
        voter: nil,
        option: nil,
        content: "MyText"
      ),
      QuestionResult.create!(
        question: nil,
        ballot: nil,
        voter: nil,
        option: nil,
        content: "MyText"
      )
    ])
  end

  it "renders a list of question_results" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
