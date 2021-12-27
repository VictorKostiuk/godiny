class Task < ApplicationRecord
  validates :title, uniqueness: {scope: :user, message: " is already in use"}

  belongs_to :user
  belongs_to :subject
end
