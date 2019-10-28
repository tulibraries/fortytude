# frozen_string_literal: true

class BuildingDashboard < BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    image: PhotoField.with_options(admin_only: true),
    name: Field::String,
    slug: Field::String.with_options(admin_only: true),
    description: DescriptionField,
    address1: Field::String,
    address2: Field::String,
    temple_building_code: Field::String,
    coordinates: Field::String,
    google_id: Field::String,
    hours: HoursField.with_options(admin_only: true),
    phone_number: PhoneField,
    campus: Field::String,
    email: Field::Email,
    policies: Field::HasMany,
    add_to_footer: Field::Boolean.with_options(admin_only: true),
    external_link: Field::BelongsTo.with_options(order: "title"),
    categories: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :slug,
    :name,
    :campus,
    :phone_number,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :image,
    :name,
    :description,
    :external_link,
    :address1,
    :address2,
    :temple_building_code,
    :phone_number,
    :campus,
    :email,
    :policies,
    :categories
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :slug,
    :image,
    :description,
    :external_link,
    :campus,
    :address1,
    :address2,
    :phone_number,
    :temple_building_code,
    :coordinates,
    :google_id,
    :hours,
    :email,
    :policies,
    :categories,
    :add_to_footer
  ].freeze

  # Overwrite this method to customize how buildings are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(building)
    "#{building.name}"
  end

  def tinymce?
    true
  end
end
