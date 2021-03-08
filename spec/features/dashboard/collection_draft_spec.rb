# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Dashboard::CollectionDrafts", type: :feature do
  before(:all) do
    @account = FactoryBot.create(:account, admin: true)
    @collection = FactoryBot.create(:collection)
    @models = ["collection"]
  end

  after(:all) do
    Account.destroy_all
    Collection.destroy_all
  end

  context "New Collection Administrate Page" do
    scenario "Create new item " do
      Rails.configuration.draftable = true
      login_as(@account, scope: :account)
      visit("/admin/collections/new")
      expect(page).to_not have_xpath("//textarea[@id=\"collection_draft_description\"]")
    end
  end

  context "Don't show draftable if draftable feature flag clear" do
    scenario "disable draftable" do
      Rails.configuration.draftable = false
      login_as(@account, scope: :account)
      visit("/admin/collections/#{@collection.id}/edit")
      expect(page).to_not have_xpath("//textarea[@id=\"collection_draft_description\"]")
    end
  end

  context "Visit Collection Administrate Page" do
    let(:new_description) { "Don't Panic!" }

    scenario "Change the Collection Description" do
      Rails.configuration.draftable = true
      login_as(@account, scope: :account)
      visit("/admin/collections/#{@collection.id}/edit")
      expect(page).to have_xpath("//div[@id=\"collection_description\"]/text()[contains(., \"#{@collection.description.body.to_trix_html}\")]")
      expect(page).to have_xpath("//trix-editor[@id=\"collection_draft_description\"]")
      find(:xpath, "//\*[starts-with(@id, \"collection_draft_description_trix_input_collection\")]", visible: false).set(new_description)
      click_button("Update Collection")
      expect(page).to have_content(@collection.description.body.to_trix_html)
      expect(page).to_not have_content(new_description)
      visit("/admin/collections/#{@collection.id}/edit")
      check(I18n.t("manifold.admin.actions.publish"))
      click_button("Update Collection")
      visit("/admin/collections/#{@collection.id}/edit")
      expect(page).to_not have_content(@collection.description.body.to_trix_html)
      expect(page).to have_content(new_description)
    end
  end
end
