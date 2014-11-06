class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task added!'
    else
      flash[:error] = "An error occurred."
      render :new
    end
  end

  def show
    @task = Task.find params[:id]
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

end
