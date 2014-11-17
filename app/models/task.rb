class Task < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :user

  def self.delete_old_tasks
  Task.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
