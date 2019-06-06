# frozen_string_literal: true

module ApplicationHelper
  def render_todays_date
    @today = Date.today.strftime("%Y-%m-%d 00:00:00")
    @today.to_date.strftime("%^A, %^B %d, %Y")
  end

  def render_todays_hours(entity, todays_hours)
        content_tag(:div, "Unavailable", class: "time") 
    unless entity.hours.blank?
      todays_hours.first.nil? ?
        content_tag(:div, "Unavailable", class: "time") :
        content_tag(:div, todays_hours.hours, class: "time")
    else
        content_tag(:div, "Unavailable", class: "time") 
    end
  end

  def render_map(name, coordinates, google_id)
    link_to image_tag("https://maps.googleapis.com/maps/api/staticmap?center=#{coordinates}&zoom=15&size=420x275&markers=size:mid%7Ccolor:red%7Clabel:%7C#{coordinates}&key=#{Rails.configuration.google_maps_api_key}", alt: "Google Map of #{name}", class: "map"),
    "https://www.google.com/maps/search/?api=1&query=#{coordinates}&query_place_id=#{google_id}"
  end
end
