FactoryBot.define do
  factory :user do
    rand1 = Random.rand(11)
    rand2 = Random.rand(1111)
    first_name { "first_name" }
    last_name { "last_name" }
    email { "email#{rand1}_#{rand1}@email.com" }
    username { "username" }
    password {"password" }
    
    # trait :admin do
    #  admin { true }
    # end

    # trait :unconfirmed do # devise confirm
    #  confirmed_at { nil }
    # end

    # factory :admin_user, traits: [:admin]
  end
end
