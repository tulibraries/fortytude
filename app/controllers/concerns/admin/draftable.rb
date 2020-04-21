# frozen_string_literal: true

module Admin::Draftable
  extend ActiveSupport::Concern

  def update
    requested_resource.update(params[resource_name].to_unsafe_hash)
    requested_resource.assign_attributes(resource_params)
    requested_resource.apply_draft if resource_params[:publish] == "1"
    if requested_resource.save
      redirect_to "/admin/#{resource_name.to_s.pluralize}/#{requested_resource[:slug]}", notice: "#{resource_name.to_s.titleize} has updated successfully"
    else
      render :edit
    end
  end
end
