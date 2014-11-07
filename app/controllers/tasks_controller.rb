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

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      redirect_to tasks_path, notice: 'Task complete!'
    else
      flash[:error] = "Something went wrong. Try again."
      render :index
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
