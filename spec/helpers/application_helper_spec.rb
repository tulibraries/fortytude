# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "render_todays_date" do
    before do
      @now = Date.new.strftime("2001-07-04 12:30:00")
      Timecop.freeze(@now)
    end

    after do
      Timecop.return
    end

    subject { render_todays_date }

    it "returns the current time" do
      expect(subject).to match(@now.to_date.strftime("%^A, %^B %d, %Y"))
    end
  end

  describe "render_todays_time" do
    before do
      @now = Date.new.strftime("2001-07-04 12:30:00")
      Timecop.freeze(@now)
    end

    after do
      Timecop.return
    end

    subject {
      building = FactoryBot.create(:building)
      render_todays_hours building, @now
    }

    it "returns the current time" do
      expect(subject).to match(@now.to_date.strftime("%^A, %^B %d, %Y"))
    end
  end
end
