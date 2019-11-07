# frozen_string_literal: true

require "rails_helper"
require "rake"
Rails.application.load_tasks

RSpec.describe LibraryHour, type: :model do

  let(:library_hour) { FactoryBot.create(:library_hour) }

  describe "Required fields" do
    example "Library Hour must have a location_id" do
      hour = FactoryBot.build(:library_hour, location_id: "")
      expect { hour.save! }.to raise_error(/Location can't be blank/)
    end
    example "Library Hour must have a date" do
      hour = FactoryBot.build(:library_hour, date: "")
      expect { hour.save! }.to raise_error(/Date can't be blank/)
    end
    example "Library Hour must have hours" do
      hour = FactoryBot.build(:library_hour, hours: "")
      expect { hour.save! }.to raise_error(/Hours can't be blank/)
    end
  end

  describe "Todays Hours" do
    before do
      @today = FactoryBot.create(:library_hour, date: Time.now.strftime("%Y-%m-%d").in_time_zone)
    end
    example "Todays Hours method returns hours data" do
      oldtime = Time.local(2019, 11, 2, 3, 0, 0)
      newtime = Time.local(2019, 11, 4, 3, 0, 0)

      Timecop.travel(oldtime)
      @tomorrow = FactoryBot.create(:library_hour, date: Time.zone.parse(newtime.to_s))
      Timecop.travel(newtime)
      binding.pry #read @tomorrow data
      Rake::Task["sync:hours"].invoke
      binding.pry #read tomorrow data


      expect( LibraryHour.todays_hours_at(@today.location_id) ).to_not be nil
    end
  end 
end
