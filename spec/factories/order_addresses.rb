FactoryBot.define do
  factory :order_address do
    postal_code { "123-4567" }
    city { "横浜市中央区" }
    address { "青山1−1" }
    phone_number { "09012345678" }
    prefecture_id {2}
    token { "sample_token" }
  end
end
