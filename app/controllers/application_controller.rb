class ApplicationController < ActionController::Base
    before_action :set_flash_and_session_objects, :authorized
    skip_before_action :authorized, only: [:new, :create]
  
    # helper_method(s) are available in the VIEWS as well
    helper_method :logged_in?, :current_user, :all_cocktails
  
    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      else
      end
    end
    
    def all_cocktails 
      @cocktails = Cocktail.all 
    end

    def logged_in?
      !!current_user
    end
  
    def authorized
      redirect_to login_path unless logged_in?
    end
  
    private
  
    def set_flash_and_session_objects
      flash[:errors] ||= [] # if flash[:errors] is nil or false, set it to empty array
    end
  end
  