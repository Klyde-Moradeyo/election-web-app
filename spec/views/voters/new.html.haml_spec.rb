require 'rails_helper'

RSpec.describe "voters/new", type: :view do
  before(:each) do
    assign(:voter, Voter.new())
  end

  it "renders new voter form" do
    render

    assert_select "form[action=?][method=?]", voters_path, "post" do
    end
  end
end
