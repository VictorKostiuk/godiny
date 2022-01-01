class MarkAsCompletedMailer < ApplicationMailer
  def new_email
    @user = params[:user]
    @task = params[:task]
    mail(to: @user.email, subject: "What's Cookin' Shopping List")
  end
end
