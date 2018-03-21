class SubTasksController < ApplicationController
  before_action :authenticate_user!, :set_task

  def create
    @sub_task = @task.sub_tasks.new(sub_task_params)
    @sub_task.user_id = current_user.id
    @sub_task.task_type = @task.task_type
    @sub_task.save
  end

  private
    def set_task
      @task = Task.find(params[:task_id])
    end

    def sub_task_params
      params[:sub_task].permit(:task_name)
    end
end
