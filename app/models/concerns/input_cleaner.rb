# frozen_string_literal: true

module InputCleaner
  extend ActiveSupport::Concern

  def normalize_phone_number
    phone_number.gsub!(/\D/, "")
  end
  def sanitize_description
    self.description.gsub!(/<p>&nbsp;<\/p>/, '')
    self.description = ActionController::Base.helpers.sanitize(self.description)
  end
end
