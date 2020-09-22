class TasksController < ApplicationController

    before_action :current_user
    before_action :current_task, only: [:show, :edit, :update, :destroy]

    def index
      if params[:category_id].present?
        @tasks = Task.by_category(params[:category_id]) 
      else
        @tasks = Task.all
      end
    end

    def new
        @task = Task.new
        @task.build_category
    end


    def create
        @task = Task.new(task_params)
        @task.user_id = session[:user_id]
    
        if @task.save
          redirect_to tasks_path
        else
          render :new
        end
    end

    def show
    end

    def edit
        if !check_users_task?
          redirect_to tasks_path
        end
    end

    def update
        if @task.update(task_params)
          redirect_to tasks_path
        else 
          render :edit
        end 
    end

    def destroy
        if check_users_task?
          @task.destroy
          redirect_to tasks_path
        end
    end

    def user_tasks
        @tasks = @user.tasks
    end

    private
    def task_params
        params.require(:task).permit(:title, :description, :user_id, :category_id, category_attributes: [:name])
    end
end
