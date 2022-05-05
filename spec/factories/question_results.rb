FactoryBot.define do
  factory :question_result do
    voter { nil }
    question { nil }
    content { "MyText" }
  end
end
