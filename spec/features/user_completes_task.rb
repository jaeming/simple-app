require 'rails_helper'

feature 'User creates task' do
  scenario 'Successfully' do
    task = create(:task)
    visit tasks_path
    page.first(".tasks").click
    expect( page ).to have_content('Task complete!')
  end
end