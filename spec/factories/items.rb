FactoryBot.define do
  factory :item do
    name                  {"test"}
    text                  {"test"}
    price                 {300}
    category_id           {11}
    prefecture_id         {48}
    scheduled_delivery_id {4}
    shipping_fee_id       {3}
    status_id             {7}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')

    end
  end
end