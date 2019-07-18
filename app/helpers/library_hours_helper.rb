# frozen_string_literal: true

module LibraryHoursHelper
  def location_name(slug)
    location = Building.find_by(hours: slug)
    unless location.nil?
      name = location.name
    end
    if location.nil?
      location = Space.find_by(hours: slug)
      unless location.nil?
        name = location.name
      end
    end
    if location.nil?
      location = Service.find_by(hours: slug)
      unless location.nil?
        name = location.title
      end
    end
    name
  end
  def location_link(slug)
    location = Building.find_by(hours: slug)
    unless location.nil?
      name = link_to location.name, location
    end
    if location.nil?
      location = Space.find_by(hours: slug)
      unless location.nil?
        name = link_to location.name, location
      end
    end
    if location.nil?
      location = Service.find_by(hours: slug)
      unless location.nil?
        name = link_to location.title, location
      end
    end
    name
  end
end
