require 'rails_helper'

RSpec.describe Ballot, type: :model do

  let(:ballot) { build(:ballot) }

  it "is valid with valid attributes" do
    expect(ballot).to be_valid
  end

  it "is not valid without a title" do
    ballot.title = nil
    expect(ballot).to_not be_valid
  end

  it "is valid without a description" do
    ballot.description = nil
    expect(ballot).to be_valid
  end
  
  it "is not valid without a start_date"  do
    ballot.start_date = nil
    expect(ballot).to_not be_valid
  end

  it "is not valid without a end_date"  do
    ballot.end_date = nil
    expect(ballot).to_not be_valid
  end

  # Assosciations
  describe "Association" do
    it { should have_many(:questions).without_validating_presence }
    it { should have_many(:partys).without_validating_presence }
    it { should have_many(:ballot_results).without_validating_presence }
  end
end
