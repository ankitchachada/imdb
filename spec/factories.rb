FactoryBot.define do
  
  factory :user do
    email { "admin@example.com" }
    password { "12345678" }
    role { "admin" }
  end

  factory :genre do
  	name {"Horror"}
  end
end