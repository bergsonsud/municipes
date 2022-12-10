FactoryBot.define do
  factory :address do
    zipcode { '12345-678' }
    street { Faker::Address.street_name }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    uf { Faker::Address.state_abbr }
    ibge_code { '99988' }
  end
end