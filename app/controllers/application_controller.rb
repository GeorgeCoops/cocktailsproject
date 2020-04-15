class ApplicationController < ActionController::Base
    before_action :set_flash_errors 

    private 

    def set_flash_errors
        flash[:errors] ||= []
    end

end
