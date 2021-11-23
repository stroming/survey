class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :same_user?
    
    def current_user
        # return current user if he exists if not return the user based on the current id session
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # returns true if current_user exists 
        !!current_user
    end

    def require_user
        if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to root_path
        end
    end

    def same_user?
        if current_user.id = @survey.user.id
            return true
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end

        return false
    end
end
