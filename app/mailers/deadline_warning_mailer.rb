class DeadlineWarningMailer < ApplicationMailer
  def warning
      @user = params[:user]
      @task = params[:task]
      mail(to: @user.email, subject: "Warning")
    end
end
