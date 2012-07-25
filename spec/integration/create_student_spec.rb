require 'spec_helper'

describe 'create student page with the happy case' do
  it 'lets the user create a student', :js => true do
    visit new_student_path
    fill_in 'Name', :with => 'J. Random Hacker'
    fill_in 'Email', :with => 'jrand@hacker.com'
    fill_in 'Phone', :with => '510-919-5691'
    fill_in 'Ssn', :with => '000000000'
    click_on 'Create Student'  
    page.should have_content('Student was successfully created')
  end
end

describe 'create student page with missing data' do
  it 'ties to create a student with all fields missing', :js => true do
    visit new_student_path
    click_on 'Create Student'  
    page.should have_content('fields required')
  end
end
