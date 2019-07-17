# frozen_string_literal: true

require "administrate/base_dashboard"

class CollectionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: DescriptionField,
    subject: MultiSelectField.with_options(
      collection: Rails.configuration.finding_aid_subjects
    ),
    # contents: DescriptionField,
    space: Field::BelongsTo,
    image: PhotoField,
    add_to_footer: Field::Boolean.with_options(admin_only: true),
    categories: Field::HasMany,
    external_link: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :space,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :image,
    :subject,
    :space,
    :categories,
    :external_link
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :image,
    :description,
    :subject,
    :categories,
    :space,
    :external_link,
    :add_to_footer,
  ].freeze

  # Overwrite this method to customize how collections are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(collection)
    "#{collection.name}"
  end

  def tinymce?
    true
  end
end
