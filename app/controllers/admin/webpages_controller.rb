# frozen_string_literal: true

module Admin
  class WebpagesController < Admin::ApplicationController
    include Admin::Draftable

    def detach
      @webpage = Webpage.find(params[:id])
      @webpage.document.purge
      flash[:notice] = "Document purged"
      redirect_to admin_webpage_path
    end

  end
end
