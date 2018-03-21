class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token

  def index
    @tasks = Task.where(parent_task_id: nil)
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def update
    if @task.update(set_task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def create
    @task = current_user.tasks.build(set_task_params)
    @task.save
    redirect_to @task
    # render plain: params[:task].inspect
  end

  def show
    # render js: "alert('The number is: #{params[:id]}')"
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private
    def set_task_params
      params.require(:task).permit(:task_name, :task_type)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
