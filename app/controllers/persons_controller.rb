# frozen_string_literal: true

class PersonsController < ApplicationController
  include PersonFilters
  before_action :set_person, only: [:show]
  before_action :get_persons, only: [:index]
  include SerializableRespondTo

  def index
    @persons = get_persons
    @fcn_link = Webpage.find_by(title: "Frequently called numbers")

    respond_to do |format|
      format.html
      format.json { render json: PersonSerializer.new(Person.all.to_a) }
    end
  end

  def show
    @buildings = @person.spaces.map { |space| space.building }.uniq
    @departments = @person.groups.sort.select { |group| group.group_type == "Department" }

    serializable_show
  end

  def get_persons
    all_persons = Person.group(:id).order(:last_name, :first_name)

    if params.has_key?("specialists")
      subjectivists = all_persons.select { |person| !person.specialties.nil? && person.specialties.reject(&:empty?).present? }
    end
    if params.has_key?("specialty")
      specialists = specialties_list(all_persons)
    end
    if params.has_key?("location")
      locationists = locations_list(all_persons)
    end
    if params.has_key?("department")
      departmentalists = departments_list(all_persons)
    end

    arrays = [Array(subjectivists), Array(specialists), Array(locationists), Array(departmentalists)].reject(&:empty?).reduce(:&) || []

    if arrays.present?
      all_persons = arrays
    end

    return_people(all_persons, all_persons)
  end


  def return_people(all, persons)
    people = []
    if params.has_key?("specialists")
      people = persons
    end

    if params.has_key?("specialty")
      if people.blank?
        special_people = specialties_list(persons).select { |p| p.id }
      else
        special_people = specialties_list(people).select { |p| p.id }
      end
    end
    if params.has_key?("department")
      if people.blank?
        department_people = departments_list(persons).select { |p| p.id }
      else
        department_people = departments_list(people).select { |p| p.id }
      end
    end
    if params.has_key?("location")
      if people.blank?
        location_people = locations_list(persons).select { |p| p.id }
      else
        location_people = locations_list(people).select { |p| p.id }
      end
    end

    filtered_people = [Array(location_people), Array(department_people), Array(special_people)].reject(&:empty?).reduce(:&) || []

    @people = filtered_people.presence || persons
    @people_list = Person.where(id: @people.map(&:id)).order(:last_name, :first_name)
    get_filters(@people_list)
    @persons_list = @people_list.page params[:page]
  end

  def get_filters(people)
    @subjects = @people.select { |person| person.specialties.try(:any?) }.collect { |p| p.specialties }.flatten.uniq.sort.reject { |s| s.empty? }
    @departments = @people.select { |person| person.groups.try(:any?) }.collect { |p| p.groups }.flatten.uniq.sort.reject { |g| g.group_type != "Department" }
    @locations = @people.select { |person| person.spaces.try(:any?) }.collect { |p| p.spaces }.flatten.uniq.sort
  end


  private
    def set_person
      @person = Person.friendly.find(params[:id])
      @department = @person.groups.collect.reject { |g| g.group_type != "Department" }.uniq.sort
      @location = @person.spaces.collect.uniq.sort
    end
end
