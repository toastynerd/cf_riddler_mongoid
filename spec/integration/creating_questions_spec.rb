require 'spec_helper'

feature "create questions" do
  before do
    visit '/'
    click_link "New Question"
  end

  scenario do
    fill_in "Ask", :with => "Why?"
    fill_in "Details", :with => "here's the details."
    click_link "Create Question"
    page.should have_content "Question was successfully created."
  end
end