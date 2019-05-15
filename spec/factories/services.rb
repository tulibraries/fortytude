# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    sequence(:title) { |n| "Service #{n}" }
    description {
    <<~EOD.strip.gsub(/\n/, " ")
      The best drink in existence is the Pan Galactic Gargle Blaster, the effect
      of which is like having your brains smashed out by a slice of lemon wrapped
      round a large gold brick.
    EOD
  }
    access_description { "Fully accessible" }
    access_link { |n| "http://www.example.com/#{n}" }
    service_policies { "Plenary" }
    intended_audience { ["General"] }
    service_category { "Hospitality" }
    hours { "12:00pm = 8:00pm" }
    related_groups { [FactoryBot.create(:group)] }
    add_to_footer { false }
  end
end
