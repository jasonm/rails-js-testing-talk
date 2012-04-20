require 'spec_helper'

feature 'Viewing an Application', :js => true do
  background do
    @application = create(:application)
    @task = create(:task, :application => @application)
  end

  scenario 'when I am not signed in' do
    Given 'I am on the home page' do
      visit root_path
    end
    When 'I visit the application list' do
      click_link 'Application'
    end
    And 'I click on the first application' do
      click_link @application.title
    end
    Then 'I should see the application' do
      page.should have_content @application.title
      page.should have_content @application.description
    end
  end

  scenario 'when I am signed in', :js => true do
    Given 'I am authenticated' do
      authenticate_user
    end
    And 'I am on the home page' do
      visit root_path
    end
    Then 'I should get redirected to the application page' do
      current_path.should eq application
    end
    And 'I click on the first application' do
      click_link @application.title
    end
    Then 'I should see the application' do
      page.should have_content @application.title
      page.should have_content @application.description
    end
  end
end
