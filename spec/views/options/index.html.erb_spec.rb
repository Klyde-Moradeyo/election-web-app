require 'rails_helper'

RSpec.describe "options/index", type: :view do
  before(:each) do
    assign(:options, [
      Option.create!(
        question: nil,
        ballot: nil,
        title: "Title",
        description: "MyText"
      ),
      Option.create!(
        question: nil,
        ballot: nil,
        title: "Title",
        description: "MyText"
      )
    ])
  end

  it "renders a list of options" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
