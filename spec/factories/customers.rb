FactoryBot.define do
  factory :customer do
    name { Faker::Name.unique.name }
    phoneNumber { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end

  factory :invalid_customer do
    name { Faker::Name.unique.name }
    phoneNumber { Faker::PhoneNumber.cell_phone }
    email { "user101@gigih" }
  end
end
