# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_account!

    helper_method :required?
    helper_method :admin_only?
    helper_method :user_editable_field?

    def required?(attribute)
      "required" if attribute.required?
    end

    def admin_only?(attribute)
      attribute.admin_only?
    end

    def user_editable_field?(account, attribute)
      !admin_only?(attribute) || account.admin
    end

    def authenticate_admin
      # TODO Add authentication logic here.
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
