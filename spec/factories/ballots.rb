FactoryBot.define do
  factory :ballot do
    user # Associaiton
    sequence(:title) { |n| "LECTURE_#{n}" }  
    description{ "This a ballot." }  
    start_date{ DateTime.now  }  
    end_date{ DateTime.now + 1.week }  
    show_results { 1 }  
    access_token { 12111121 }
  end
end
