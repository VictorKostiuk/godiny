class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_as_completed, :find_subject]

  def index
    @tasks = current_user.tasks
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(tasks_params)

        if @task.save
#           DeadlineWorker.perform_in(5.seconds)
          DeadlineWorker.perform_async(current_user.id, @task.id)
          redirect_to @task
        else
          render :new
        end
  end


  def edit
  end

    def update
      if @task.update(tasks_params)
        redirect_to @task, status: :ok
      else
        render :edit
      end
    end

   def destroy
      @task.destroy
         redirect_to tasks_path, notice: 'Todo was successfully destroyed.',status: :no_content
    end

  def mark_as_completed
    if @task.completed == false
      @task.update_attribute(:completed, true)
      MarkAsCompletedMailer.with( user: current_user, task: @task).new_email.deliver_now
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