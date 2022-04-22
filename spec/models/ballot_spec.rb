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
  
  it "is not valid without a URL" do
    ballot.URL = nil
    expect(ballot).to_not be_valid
  end

  it "is not valid without a ballot_type"  do
    ballot.ballot_type = nil
    expect(ballot).to_not be_valid
  end
  
  it "is not valid without a start_date"  do
    ballot.start_date = nil
    expect(ballot).to_not be_valid
  end

  it "is not valid without a end_date"  do
    ballot.end_date = nil
    expect(ballot).to_not be_valid
  end

  it "is valid with a weighted_voting false"  do
    ballot.weighted_voting = 0
    expect(ballot).to be_valid
  end

  it "is valid with a show_results false"  do
    ballot.show_results = 0
    expect(ballot).to be_valid
  end

  # Assosciations
  describe "Association" do
    it { should have_many(:voters).without_validating_presence }
    it { should have_many(:questions).without_validating_presence }
    it { should have_many(:partys).without_validating_presence }
    it { should have_many(:ballot_results).without_validating_presence }
  end
end
