FactoryBot.define do
  factory :menu_item_order do
    menu_item { nil }
    order { nil }
    qty { 1 }
  end
end
