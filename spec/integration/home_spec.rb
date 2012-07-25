require 'spec_helper'

describe 'touch home page' do
  it 'is the system start page' do
    visit '/'
    page.should have_content('Enrollment System')
  end
end
