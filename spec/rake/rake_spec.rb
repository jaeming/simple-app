require 'rails_helper'
require 'rake'

describe "Rake delete_items" do

  before do
    @task1 = create(:task)
    @task1.created_at = 8.days.ago
    @task1.save!
    Rake.application.rake_require "tasks/delete_items"
    Rake::Task.define_task(:environment)
  end

  let :run_rake_task do
      Rake::Task["delete_items"].reenable
      Rake.application.invoke_task "delete_items"
  end

  it "deletes tasks more than 7 days old" do
    run_rake_task
    expect(@task1).to eq(nil)
  end
end