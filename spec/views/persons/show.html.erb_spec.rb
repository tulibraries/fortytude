# frozen_string_literal: true

require "rails_helper"

RSpec.describe "persons/show", type: :view do

  let(:building) { FactoryBot.create(:building) }
  let(:space) { FactoryBot.create(:space, building: building) }

  before(:each) do
    @buildings = [building]
  end

  it "displays the sample person image" do
    @person = FactoryBot.create(:person, :with_image, spaces: [space])
    render
    expect(rendered).to match /#{@person.image.attachment.blob.filename.to_s}/
  end

  it "displays the default image when no custom image supplied" do
    @person =  FactoryBot.create(:person, spaces: [space])
    render
    expect(rendered).to match /#{"assets/T-"}/
  end
end
