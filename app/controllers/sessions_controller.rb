class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def login
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
          @user = User.find_or_create_by_omniauth(auth_hash)
          session[:user_id] = @user.id
          redirect_to user_tasks_path(@user.id)
        else 
          @user = User.find_by(username: params[:username])
          if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_tasks_path(@user.id)
          else
            flash[:errors] = ["Bad Username or Pasword"]
            render :new
          end
        end 
    
      end

end