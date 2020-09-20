FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.initials}
    first_name {"田中"}
    last_name {"太郎"}
    first_name_kana {"タナカ"}
    last_name_kana {"タロウ"}
    birth_date {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end