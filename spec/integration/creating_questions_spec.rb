require 'spec_helper'

feature "create questions" do
  before do
    visit '/'
    click_link "New Question"
  end

  scenario do
    fill_in "Ask", :with => "Why?"
    fill_in "Detail", :with => "here's the details."
    click_button "Create Question"
    page.should have_content "Question was successfully created."
  end

  scenario do
    fill_in "Ask", :with => ""
    click_button "Create Question"
    page.should have_content "Question could not be created."
    page.should have_content "Ask can't be blan"
  end
end