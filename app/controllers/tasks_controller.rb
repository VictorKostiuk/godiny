class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_as_completed, :find_subject]

  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(tasks_params)

        if @task.save
          redirect_to @task
        else
          render :new
        end
  end


  def edit
  end

  def update

    if @task.update(tasks_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def mark_as_completed
    if @task.completed == false
      @task.update_attribute(:completed, true)
      redirect_to root_path
    else
      @task.update_attribute(:completed, false)
      redirect_to root_path
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :subject_id, :subject, :description, :deadline)
  end
end