require 'spec_helper'

feature 'Viewing an Application', :js => true do
  background do
    Given 'there is an application and task'
  end

  scenario 'when I am not signed in' do
    Given 'I am on the home page'
    When  'I visit the application'
    And   'I click on the first application'
    Then  'I should see the application'
  end

  scenario 'when I am signed in', :js => true do
    Given 'I am authenticated'
    When  'I am on the home page'
    Then  'I should get redirected to the application page'
    When  'I click on the first application'
    And   'I should see the application'
  end
end
