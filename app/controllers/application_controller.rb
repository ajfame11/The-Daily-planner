class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?

    def current_user    
        @user = User.find_by(id: session[:user_id])  
    end

    def current_task
        @task = Task.find_by_id(params[:id])
    end 

    def logged_in?
        !!current_user
    end 

    def check_users_post?
        current_post.user_id == current_user.id
    end 

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

end