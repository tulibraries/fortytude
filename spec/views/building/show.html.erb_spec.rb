# frozen_string_literal: true

require "rails_helper"

RSpec.describe "buildings/show", type: :view do
  context "hours" do
    example "Location is campus building" do
      #@building = FactoryBot.create(:building)
      assign(:building, FactoryBot.create(:building))
      render
      expect(rendered).to have_selector("#date") 
      expect(rendered).to have_selector("#time") 
    end
  end
end
