# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Recall Book Form", type: :request do

  let(:form_type) { "recall-book" }
  let(:form_params) {
    {
      phone: "1234567890", tu_id: "test_id", department: "test dept",
      affiliation: "Staff", author: "test author", title: "test title",
      call_number: "test call number", substitute_edition: "false",
      pickup_location: "Ambler"
      # Cencellation date doesn't appear in the email
      #"cancellation_date(1i)" => "2019",
      #"cancellation_date(2i)" => "25", "cancellation_date(3i)" => "1"
    }
  }

  it_behaves_like "email form"

end
