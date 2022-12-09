FactoryBot.define do
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { 125_795_486_880_001 }
    email { Faker::Internet.email }
    birthdate { Date.new(2017, 1, 2) }
    phone { 5_585_986_225_910 }
    status { true }
    picture { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/municipe.png'), 'image/png', true) }
  end

  factory :another_municipe do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { 938_941_332_020_018 }
    email { Faker::Internet.email }
    birthdate { Date.new(2019, 1, 2) }
    phone { 5_585_986_155_912 }
    status { true }
  end

  trait :with_picture do
    after(:create) do |d|
      d.files.attach(io: File.open(Rails.root.join('spec/support', 'municipe.png')), filename: 'municipe.png',
        content_type: 'image/png')
    end
  end

  factory :fulano, traits: [:with_picture]
end
