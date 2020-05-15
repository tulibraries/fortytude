# frozen_string_literal: true

class PoliciesController < ApplicationController
  include HasCategories
  include SetInstance
  include RedirectLogic
  include SerializableRespondTo
  before_action :set_policy, only: [:show]

  def index
    serializable_index
  end

  def show
    @categories = @policy.categories
    serializable_show
  end

  def list_item(category)
    cat_link(category, @policy)
  end
  helper_method :list_item

  private
    def set_policy
      @policy = find_instance
      return redirect_or_404 unless @policy
    end
end
