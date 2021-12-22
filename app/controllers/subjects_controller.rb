class SubjectsController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subjects_params)

        if @subject.save
          redirect_to @subject
        else
          render :new
        end
  end


  def edit
  end

  def update

    if @subject.update(subjects_params)
      redirect_to @subject
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subjects_params
    params.require(:subject).permit(:title, :task)
  end
end