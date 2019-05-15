# frozen_string_literal: true

class ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :set_service, only: [:show]

  def index
    @services = Service.all
    respond_to do |format|
      format.html
      format.json { render json: ServiceSerializer.new(@services) }
    end
  end

  def show
    @services = Service.all
    groups = @services.group_by { |service| service.service_category }
    @grouped_services = Hash[ groups.sort_by { |key, val| key } ]
    @key_group = @service.service_category
    respond_to do |format|
      format.html
      format.json { render json: ServiceSerializer.new(@service) }
    end
  end

  private
    def set_service
      @service = Service.find(params[:id])
      @categories = @service.categories
    end
end
