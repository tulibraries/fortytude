class WpviController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", except: :index
  before_action :init, only: [:index, :show, :search]

  def ensemble_api(api_query)
    videos = HTTParty.get(api_query)
    begin
      @videos = JSON.parse(videos&.body, symbolize_names: true)
    rescue => e
      e.message
    end
  end

  def init
    @libraryID = "88bb2276-47db-4ee7-9d23-062b072dc158"
    @user = ENV["ENSEMBLE_API_USER"]
    @key = ENV["ENSEMBLE_API_KEY"]
    @basepath = "https://svc.#{@user}:#{@key}@ensemble.temple.edu/api"
    @medialibrary = "/medialibrary/" + @libraryID + "?PageIndex=1&PageSize=1000"
  end

  def search
    api_query = @basepath + @medialibrary + "&FilterValue=" + URI::encode(params[:q])
    ensemble_api(api_query)
    # @videos = @videos.page params[:page]
    unless @videos.nil?
      @searchterm = params[:q]
    else
      return redirect_to(pages_videos_all_path, alert: "Unable to retrieve videos.")
    end
  end

	def index
	end

	def show
    api_query = @basepath + "/content/" + params[:id]
    ensemble_api(api_query)
    if @videos.nil?
      return redirect_to(pages_videos_all_path, alert: "Unable to retrieve video.")
    end
	end
end
