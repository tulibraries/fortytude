# frozen_string_literal: true

class FindingAid < ApplicationRecord
  include InputCleaner
  include Categorizable
  include Draftable
  include Validators
  include SchemaDotOrgable
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  friendly_id :slug_candidates, use: :slugged
  validates :slug, presence: true

  paginates_per 15

  before_save :weed_nils

  has_paper_trail

  before_validation :sanitize_description
  validates :collection_id, collection_or_subject: true

  serialize :subject

  has_many :collection_aids, dependent: :destroy
  has_many :collections, through: :collection_aids

  has_many :finding_aid_responsibilities, dependent: :destroy
  has_many :person, through: :finding_aid_responsibilities

  def slug_candidates
    [
      :name,
      [:name, :identifier]
    ]
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end

  has_draft :description

  def schema_dot_org_type
    "ArchiveComponent"
  end

  def additional_schema_dot_org_attributes
    {
      about: subject.map(&:inspect).join(", "),
      isPartOf: collections.map(&:inspect).join(", "),
      identifier: identifier
    }
  end

  private
    # TODO: find and eliminate the cause of nil values on form submission
    def weed_nils
      subject.reject! { |s| s == "" }
    end
end
