FactoryBot.define do
  factory :credit do
    postal_code              {"123-1234"}
    prefecture_id            {48}
    city                     {"横浜市"}
    house_number             {"青山"}
    phone_number             {"09012345678"}
    token                    {"tok_abcdefghijk00000000000000000"}
    building_name            {"青山"}
  end
end
