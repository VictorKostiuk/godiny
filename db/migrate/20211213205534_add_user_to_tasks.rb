class AddUserToTasks < ActiveRecord::Migration[6.1]
  def change
     create_table :user_tasks do |t|
          t.belongs_to :user
          t.belongs_to :task
    end
  end
end
