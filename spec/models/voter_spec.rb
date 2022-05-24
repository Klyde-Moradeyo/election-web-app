require 'rails_helper'

RSpec.describe Voter, type: :model do
  let(:voter) { build(:voter) }

  it "is valid with valid attributes" do
    expect(voter).to be_valid
  end

  it "is not valid without a username" do
    voter.username = nil
    expect(voter).to_not be_valid
  end

  it "is not valid without a email" do
    voter.email = nil
    expect(voter).to_not be_valid
  end

  it "is not valid without a valid email format" do
    voter.email = "email.com"
    expect(voter).to_not be_valid
  end

  # Assosciations
  describe "Association" do
    it { should belong_to(:ballot).without_validating_presence }
    it { should have_many(:question_results).without_validating_presence }
  end
end
