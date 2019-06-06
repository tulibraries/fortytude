# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def label
    respond_to?(label_method) ? self[label_method] : "#{self.class.to_s}_#{id}"
  end

  def label_method
    :name
  end
end
