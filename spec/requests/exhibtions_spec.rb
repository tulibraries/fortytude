# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Exhibitions", type: :request do

  describe "a redirect with a legacy path starting with /exhibitions" do
    let(:redirect) { FactoryBot.create(:exhibition_redirect) }
    it "redirects to the expected redirect path" do
      get url_for(redirect.legacy_path)
      expect(response).to redirect_to(redirect.path)
    end
  end

end
