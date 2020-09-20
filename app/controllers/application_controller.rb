class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user    
        @user = User.find_by(id: session[:user_id])  
    end

    def current_task
        @task = Task.find_by(params[:id])
    end 

    def get_all_tasks
        @tasks = Task.all
    end 

    def logged_in?
        !current_user.nil?
    end 

    def authorized
        redirect_to '/login' unless logged_in?
    end

    def check_users_task?
        current_task.user_id == current_user.id
    end  

end