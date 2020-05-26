FactoryBot.define do
  factory :user do
    name { "MyString" }
    id_name { "MyString" }
    email { "MyString" }
    bio { "MyText" }
    password_digest { "MyString" }
  end
end
