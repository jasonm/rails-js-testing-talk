require 'spec_helper'

feature 'Viewing an Application', :js => true do
  background do
    @application = create(:application)
    @task = create(:task, :application => @application)
  end

  scenario 'when I am not signed in' do
    visit root_path
    click_link 'Applications'
    click_link @application.title

    page.should have_content @application.title
    page.should have_content @application.description
  end

  scenario 'when I am signed in', :js => true do
    authenticate_user
    visit root_path
    current_path.should eq application
    click_link @application.title

    page.should have_content @application.title
    page.should have_content @application.description
  end
end
