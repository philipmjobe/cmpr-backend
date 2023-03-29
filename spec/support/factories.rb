require 'faker'

FactoryBot.define do
  factory :campground do
    lon { Faker::Address.longitude }
    lat { Faker::Address.latitude }
    gps_composite_field { Faker::Address.street_address }
    campground_code { Faker::Alphanumeric.alpha(number: 10) }
    campground_name { Faker::Company.name }
    campground_type { Faker::Lorem.word }
    phone_number { Faker::PhoneNumber.phone_number }
    dates_open { Faker::Date.between(from: '2022-01-01', to: '2022-12-31') }
    comments { Faker::Lorem.paragraph }
    number_of_campsites { Faker::Number.between(from: 1, to: 100) }
    elevation { Faker::Number.decimal(l_digits: 2) }
    amenities { Faker::Lorem.sentence }
    state { Faker::Address.state }
    nearest_town { Faker::Address.city }
  end

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
