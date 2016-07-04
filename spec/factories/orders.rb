FactoryGirl.define do
  factory :order do
    customer_name { Faker::Name.name }
    description { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    quantity { [*1..10].sample }
    address { Faker::Address.street_address }
    provider { Faker::Company.name }
    import_file
  end
end
