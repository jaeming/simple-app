class TasksController < ApplicationController
  respond_to :html, :json, :js

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task added!'
    else
      flash[:error] = "An error occurred."
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:notice] = "Task complete!"
    else
      flash[:error] = "Something went wrong. Try again."
    end

    respond_with(@task) do |format|
      format.html { redirect_to tasks_path }
  end
end

  def show
    @task = Task.find params[:id]
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      respond_with(@task) do |format|
        format.html { redirect_to tasks_path }
    end
    # do |format|
    #   format.html { redirect_to tasks_path }
    # end
  end
end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
