require 'rails_helper'

feature "user edits task" do
  scenario "successfully" do
    task = create(:task)
    visit tasks_path


  end
end