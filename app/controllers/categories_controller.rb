# frozen_string_literal: true

class CategoriesController < ApplicationController
  include HasCategories
  include SetInstance
  include RedirectLogic
  before_action :set_category, only: [:show]
  include SerializableRespondTo

  def show
    @covid_alert = @category.covid_alert

    respond_to do |format|
      format.html {
        @nav_items = []
        @category.items.each do |item|
          @nav_items << item
        end
      }
    end

    if @category.slug == "coronavirus"
      @image = "floor_plans_FALL_2020_onepage.jpg"
    end

    if @category.slug == "explore-charles"

      @images = []
      26.times do |i|
        @images << (i.to_s + ".jpg")
      end
      @captions = []
      @captions << "1st floor floorplan"
      @captions << "2nd floor floorplan"
      @captions << "3rd floor floorplan"
      @captions << "4th floor floorplan"
      @captions << "Fourth floor open browsing stacks, photo by Michael Grimm"
      @captions << "24/7 study space, photo by Michael Grimm"
      @captions << "Exterior, photo by Michael Grimm"
      @captions << "Atrium, photo by Michael Grimm"
      @captions << "Library entrance on 13th Street, photo by Michael Grimm"
      @captions << "View from oculus into third floor viewing area, photo by Michael Grimm"
      @captions << "Third floor oculus viewing area in the Duckworth Scholars Studio, photo by Michael Grimm"
      @captions << "Exterior, photo by Michael Grimm"
      @captions << "Library entrance, corner of Polett and Liacouras Walks, photo by Michael Grimm"
      @captions << "Event space, photo by Michael Grimm"
      @captions << "Faculty and graduate study area, photo by Michael Grimm"
      @captions << "Green roof, photo by Michael Grimm"
      @captions << "Loretta C. Duckworth Scholars Studio, photo by Michael Grimm"
      @captions << "View of atrium, photo by Michael Grimm"
      @captions << "Makerspace in the Loretta C. Duckworth Scholars Studio, photo by Michael Grimm"
      @captions << "Oculus on the fourth floor, photo by Michael Grimm"
      @captions << "One Stop Assistance desk, photo by Michael Grimm"
      @captions << "Second floor open seating, photo by Michael Grimm"
      @captions << "Fourth floor quiet reading room, photo by Michael Grimm"
      @captions << "Third floor reading room, photo by Michael Grimm"
      @captions << "Albert M. Greenfield Special Collections Research Center Reading Room, photo by Michael Grimm"
      @captions << "Student Success Center, photo by Michael Grimm"
    end
  end

  def index
    serializable_index
  end

  private
    def set_category
      @category = find_instance
      return redirect_or_404 unless @category
    end
end
