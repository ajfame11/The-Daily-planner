class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to login_path
      else
        render :new
      end   
    end
  
    def edit
      current_user
    end
  
    def update
      current_user
      if @user.update(user_params)
        redirect_to tasks_path
      else 
        render :edit
      end 
    end 
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end 
  
  end