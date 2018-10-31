# frozen_string_literal: true

require "rails_helper"

RSpec.describe FuzzyFind::FinderService do

  class UndefinedModel; end
  class MockModel < ApplicationRecord
    #Stub this since we don't actually have a table for this
    def self.where(args)
      []
    end
  end

  let(:needle) { "thing_to_search_for" }
  let(:haystack_model) { MockModel }
  let(:attribute) { :name }
  let(:called_service) {
    described_class.call(
      needle: needle,
      haystack_model: haystack_model,
      attribute: attribute
    )
  }

  it "responds to #call" do
    expect(described_class).to respond_to :call
  end

  describe "#call" do
    it "throws an error if needle param is not supplied" do
      expect { described_class.call(haystack_model: MockModel) }.to raise_error(ArgumentError)
    end

    it "throws an error if haystack_model param is not supplied" do
      expect { described_class.call(needle: "thing_to_find") }.to raise_error(ArgumentError)
    end

    it "can be called without attribute argument" do
      expect {
          described_class.call(needle: needle, haystack_model: haystack_model)
        }.to_not raise_error
    end

    it "can accept an attribute argument" do
      expect { called_service }.not_to raise_error
    end

    context "haystack_model is not a defined model" do
      let(:haystack_model) { UndefinedModel }
      it "raises a FuzzyFind::FindererService Error" do
        expect { called_service }.to raise_error(described_class::Error)
      end
    end

    context "search for a person" do
      before do
        building = FactoryBot.create(:building)
        @space = FactoryBot.create(:space, building: building)
        FactoryBot.create(:person, spaces: [@space])
        @group = FactoryBot.create(:group, spaces: [@space], chair_dept_head: Person.take(1).first)

        @new_person = Person.create!(
          first_name: "New", last_name: "Person",
          phone_number: "1234567890",
          email_address: "new.person@temple.edu",
          groups: [@group], spaces: [@space],
          job_title: "FooBarbarian")
      end

      context "with a similar name" do
        it "returns the expected person" do
          expect(described_class.call(
                   needle: "Newish Person",
                   haystack_model: Person,
                   attribute: :name)
          ).to eql @new_person
        end

        context "and an simple additional attribute" do
          it "returns the expected person" do
            expect(
              described_class.call(
                needle: "Newish Person",
                haystack_model: Person,
                attribute: :name,
                addl_attribute: { email_address: "new.person@temple.edu" }
              )
            ).to eql @new_person
          end
        end

        context "and an association additional attribute" do
          context "passing an object" do
            it "returns the expected person" do
              expect(
                described_class.call(
                  needle: "Newish Person",
                  haystack_model: Person,
                  attribute: :name,
                  addl_attribute: { groups: @group }
                )
              ).to eql @new_person
            end
          end

          context "passing an id string" do
            it "returns the expected person" do
              expect(
                described_class.call(
                  needle: "Newish Person",
                  haystack_model: Person,
                  attribute: :name,
                  addl_attribute: { groups: "1" }
                )
              ).to eql @new_person
            end
          end

          context "passing an id int" do
            it "returns the expected person" do
              expect(
                described_class.call(
                  needle: "Newish Person",
                  haystack_model: Person,
                  attribute: :name,
                  addl_attribute: { groups: 1 }
                )
              ).to eql @new_person
            end
          end
        end
      end

      context "with a name that does not match at all" do
        it "returns nil" do
          expect(described_class.call(
                   needle: "kikkilij mqwwewe",
                   haystack_model: Person,
                   attribute: :name)
          ).to eql nil
        end
      end
    end
  end
end
