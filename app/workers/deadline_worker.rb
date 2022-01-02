class DeadlineWorker
  include Sidekiq::Worker

  def perform(user_id, task_id)
    DeadlineWarningMailer.with( user:  User.find(user_id), task: Task.find(task_id)).warning.deliver_now
  end
end
