require 'rails_helper'

feature "user edits task" do
  scenario "successfully" do
    task = create(:task)
    visit tasks_path
    page.first(".task-icon-edit").click
    fill_in 'Description', with: 'Cancel my perm.'
    click_button 'Add'
    visit tasks_path
    expect( page ).to have_content('Cancel my perm.')
  end
end