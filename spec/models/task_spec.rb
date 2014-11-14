require 'rails_helper'

RSpec.describe Task, :type => :model do
  it "deletes tasks more than 7 days old" do
    @task1 = create(:task)
    @task1.created_at = 8.days.ago
    @task1.save!
    @task2 = create(:task)

    Task.delete_old_tasks

    @task2.reload

    expect(Task.find_by(id:@task1.id)).to be nil
    expect(@task2.destroyed?).to be false
  end
end
