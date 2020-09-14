class TasksController < ApplicationController

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


    private
    def task_params
        params.require(:task).permit(:title, :description, :category_id, category_attributes: [:name])
    end
end
