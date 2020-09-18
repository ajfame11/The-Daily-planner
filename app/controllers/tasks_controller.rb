class TasksController < ApplicationController

    before_action :current_user
    before_action :current_task, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
        @task.build_category
    end


    def create
        @task = Task.new(task_params)
        @task.user_id = session[:user_id]
        if @task.save
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    def show
    end

    def edit
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
        params.require(:task).permit(:title, :description, :category_id, category_attributes: [:name])
    end
end
