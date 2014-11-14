class TasksController < ApplicationController
  respond_to :html, :json, :js

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.save!
    respond_with(@task) do |format|
      format.html { redirect_to tasks_path }
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy!
    respond_with(@task) do |format|
      format.html { redirect_to tasks_path }
    end
  end

  def show
    @task = current_user.tasks.find params[:id]
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attributes(task_params)
    respond_with(@task) do |format|
      format.html { redirect_to tasks_path }
    end
    # do |format|
    #   format.html { redirect_to tasks_path }
    # end
  end


  private

  def task_params
    params.require(:task).permit(:description)
  end
end
