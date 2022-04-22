FactoryBot.define do
  factory :ballot do
    user # Associaiton
    sequence(:title) { |n| "LECTURE_#{n}" }  
    description{ "This a ballot." }  
    URL{ "Generated URL form ballot" }  
    ballot_type{ "Poll" }  
    start_date{ DateTime.now  }  
    end_date{ DateTime.now + 1.week }  
    weighted_voting{ 1 }  
    show_results { 1 }  
  end
end
