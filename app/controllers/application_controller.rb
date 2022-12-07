class ApplicationController < ActionController::Base
  include SessionsHelper

  private
      #Confirms log-in and stores location of the initial request.
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url, status: :see_other
        end
      end
end
