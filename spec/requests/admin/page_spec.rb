# frozen_string_literal: true

require "rails_helper"

RSpec.describe Page, type: :request do
  it_behaves_like "renderable_dashboard"

  describe "GET /page/:id/detach" do
    it "detaches document from page" do
      page = FactoryBot.create(:page, :with_document)
      login_as(FactoryBot.create(:administrator), scope: :account)

      get "/admin/pages/#{page.id}/edit"
      expect(response).to render_template(:edit)
      expect(response.body).to include("hal.png")

      get "/admin/pages/#{page.id}/detach"
      follow_redirect!

      get "/admin/pages/#{page.id}/edit"
      expect(response).to render_template(:edit)
      expect(response.body).to_not include("hal.png")
    end
  end
end
