FactoryBot.define do
  factory :order do
    customer_id { nil }
    total { 2 }
    order_date { "2022-04-20 06:40:21" }
    status {:NEW}
  end
end
