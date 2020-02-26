# frozen_string_literal: true

require "administrate/base_dashboard"

class PageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    slug: Field::String.with_options(admin_only: true),
    document: FileField,
    group: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    description: DescriptionField,
    layout: Field::Select.with_options(
      collection: Rails.configuration.page_layouts,
      multiple: false,
      ),
    categories: Field::HasMany,
    accounts: Field::HasMany.with_options(admin_only: true),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :categories,
    :accounts
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :slug,
    :description,
    :document,
    :group,
    :categories,
    :accounts,
    :layout
  ].freeze

  # Overwrite this method to customize how pages are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(page)
  #   "Page ##{page.id}"
  # end

  # permitted for has_many_attached
  # def permitted_attributes
  #   super + [documents: []]
  # end

  def display_resource(page)
    "#{page.title}"
  end

  def tinymce?
    true
  end
end