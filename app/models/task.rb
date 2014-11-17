class Task < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :user

  def self.delete_old_tasks
  Task.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

  def time_left
    ((self.created_at.to_date + 7.days) - Date.today).to_i
  end
# time_ago_in_words(task.created_at + 7.days)
end
