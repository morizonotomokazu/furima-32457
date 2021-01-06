FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"123efs"}
    password_confirmation {password}
    first_name            {"漢字タた"}
    last_name             {"漢字タた"}
    first_name_kana       {"カタカナ"}
    last_name_kana        {"カタカナ"}
    birth_date            {"1234-12-30"}
  end
end