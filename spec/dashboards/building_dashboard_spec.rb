require "rails_helper"

RSpec.describe BuildingDashboard do #, type: :controller do
  describe "#tinymce?" do
    it "returns the local override value" do
      expect(BuildingDashboard.new.tinymce?).to be true
    end
  end
end
