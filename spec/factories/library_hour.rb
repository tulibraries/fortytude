# frozen_string_literal: true

FactoryBot.define do
  factory :library_hour, class: "LibraryHour" do
    location { "paley library" }
    date { "2018-09-06 14:57:01" }
    hours { "8:00 am - 7:00 pm" }
    location_id { "1" }
  end
end
