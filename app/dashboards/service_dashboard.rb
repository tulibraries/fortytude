require "administrate/base_dashboard"

class ServiceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    related_spaces: Field::HasMany.with_options(class_name: "Space"),
    related_groups: Field::HasMany.with_options(class_name: "Group"),
    id: Field::Number,
    title: Field::String,
    description: DescriptionField.with_options(required: true),
    access_description: DescriptionField.with_options(required: true),
    access_link: Field::String,
    service_policies: DescriptionField.with_options(required: true),
    intended_audience: Field::Select.with_options(
      collection: Rails.configuration.audience_types
    ),
    service_category: Field::Select.with_options(
      collection: Rails.configuration.service_types
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :service_space,
    :related_spaces,
    :service_group,
    :related_groups,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :related_spaces,
    :related_groups,
    :id,
    :title,
    :description,
    :access_description,
    :access_link,
    :service_policies,
    :intended_audience,
    :service_category,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :related_spaces,
    :related_groups,
    :title,
    :description,
    :access_description,
    :access_link,
    :service_policies,
    :intended_audience,
    :service_category,
  ].freeze

  def display_resource(service)
    "Service ##{service.id}"
  end

  def tinymce?
    true
  end
end
