require 'rails_helper'

RSpec.describe "voters/edit", type: :view do
  before(:each) do
    @voter = assign(:voter, Voter.create!())
  end

  it "renders the edit voter form" do
    render

    assert_select "form[action=?][method=?]", voter_path(@voter), "post" do
    end
  end
end
