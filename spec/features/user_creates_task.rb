require 'rails_helper'

feature 'User creates Task' do
  scenario 'Successfully' do
    visit new_task_path
      fill_in 'Description', with: 'Get a perm at my favorite salon'
      click_button 'Add'
      expect( page ).to have_content('Task added!')
      expect( page ).to have_content('Get a perm at my favorite salon')
  end
end
