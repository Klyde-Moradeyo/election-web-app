require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        ballot: nil,
        question_type: "Question Type",
        title: "Title",
        description: "MyText",
        randomize_selection: false,
        voter_abstain: false
      ),
      Question.create!(
        ballot: nil,
        question_type: "Question Type",
        title: "Title",
        description: "MyText",
        randomize_selection: false,
        voter_abstain: false
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Question Type".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
