class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.datetime :deadline

      t.belongs_to :user
      t.belongs_to :subject

      t.timestamps
    end
  end
end
