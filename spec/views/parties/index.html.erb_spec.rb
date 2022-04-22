require 'rails_helper'

RSpec.describe "parties/index", type: :view do
  before(:each) do
    assign(:parties, [
      Party.create!(
        ballot: nil,
        title: "Title",
        description: "MyText"
      ),
      Party.create!(
        ballot: nil,
        title: "Title",
        description: "MyText"
      )
    ])
  end

  it "renders a list of parties" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
