# frozen_string_literal: true
include ActionDispatch::TestProcess

FactoryBot.define do
  factory :building do
    sequence(:name) { |n| "Charles Samuel Addams Library #{n}" }
    description { "Main Campus Main Library" }
    address1 { "1250 Polett Walk" }
    address2 { "Philadelphia, PA 19122" }
    temple_building_code { "ABC" }
    coordinates { "test,coordinated" }
    google_id { "12345678910azby-kk" }
    hours { "paley" }
    phone_number { "2155551212" }
    campus { "Main Campus" }
    email { "csa@example.edu" }
    photo { fixture_file_upload(fixture_path+'/charles.jpg'), 'image/jpg') }

    factory :building_with_people do
      after(:create) do |building|
        create_list(:person, 1, buildings: [building])
      end
    end

    factory :building_with_groups do
      after(:create) do |building|
        create_list(:group, 1, buildings: [building])
      end
    end
  end
end
