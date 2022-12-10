FactoryBot.define do
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { 125795486880001 }
    email { Faker::Internet.email }
    birthdate { Date.new(2017, 1, 2) }
    phone { 5585986225910 }
    status { true }
    picture { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/municipe.png'), 'image/png', true) }
    address_attributes { attributes_for(:address) }
  end
end
