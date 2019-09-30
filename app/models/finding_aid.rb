# frozen_string_literal: true

class FindingAid < ApplicationRecord
  include InputCleaner
  include Categorizable

  before_save :weed_nils
  before_validation :sanitize_description

  has_paper_trail
  paginates_per 15

  scope :with_subject, ->(subjects) {
    where(subject_query(subjects), subjects.map {|s| "%#{s}%" }) if subjects.present?
  }

  scope :in_collection, ->(collection_id) {
    includes(:collections).where(:collections => {'id' => collection_id}) if collection_id.present?
  }

  serialize :subject

  has_many :collection_aids
  has_many :collections, through: :collection_aids

  has_many :finding_aid_responsibilities
  has_many :person, through: :finding_aid_responsibilities

  private
    # TODO: find and eliminate the cause of nil values on form submission
    def weed_nils
      subject.reject! { |s| s == "" }
    end

    def self.subject_query(subjects)
      subjects.size.times.map { |s| "subject LIKE (?)"}.join(" AND ")
    end

end
