class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @title = "Task list"
  end

  def show
    @title = "The task"
  end

  def new
    @task = Task.new
    @title = "Add a task"
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
     @title = "Modify the task '#{@task.name}'"
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :done)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
