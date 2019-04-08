# frozen_string_literal: true

class Building < ApplicationRecord
  has_paper_trail
  include Validators
  include InputCleaner
  include HasPolicies
  include SetDates
  require "uploads"

  validates :name, :address1, :address2, :temple_building_code, :coordinates, :google_id, :campus, presence: true
  validates :phone_number, presence: true, phone_number: true
  validates :description, presence: true

  has_many :library_hours
  has_many :spaces

  has_one_attached :photo, dependent: :destroy

  auto_strip_attributes :email

  before_validation :normalize_phone_number
  before_validation :sanitize_description

  has_many :categorizations, as: :categorizable

  def index_image
    variation =
      ActiveStorage::Variation.new(Uploads.resize_to_fill(width: 250, height: 190, blob: photo.blob, gravity: "Center"))
    ActiveStorage::Variant.new(photo.blob, variation)
  end
  def show_image
    variation =
      ActiveStorage::Variation.new(Uploads.resize_to_fill(width: 600, height: 450, blob: photo.blob, gravity: "Center"))
    ActiveStorage::Variant.new(photo.blob, variation)
  end
end
