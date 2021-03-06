# frozen_string_literal: true

require "rails_helper"

RSpec.describe "webpages/show", type: :view do

  before(:each) do
    view.lookup_context.prefixes << "application"
  end

  it "displays the sample webpage pdf" do
    @webpage = FactoryBot.create(:webpage, :with_file)
    render
    expect(rendered).to render_template(partial: "_attachments")
    expect(rendered).to match /#{@webpage.file_uploads.first.name}/
    expect(rendered).to match /-- View PDF/
  end

  it "displays multiple sample webpage pdfs" do
    @webpage = FactoryBot.create(:webpage, :with_files)
    render
    @webpage.file_uploads.each do |wp|
      expect(rendered).to match /#{wp.name}/
    end
  end

  it "displays a virtual tour" do
    @webpage = FactoryBot.create(:webpage, :as_virtual_tour)
    render
    expect(rendered).to render_template(partial: "_virtual-tour")
    expect(rendered).to match /TOUR NAME/
  end

  it "displays an external link" do
    @webpage = FactoryBot.create(:webpage, :with_external_link)
    render
    expect(rendered).to match /"#{@webpage.external_link.link}/
  end

end
