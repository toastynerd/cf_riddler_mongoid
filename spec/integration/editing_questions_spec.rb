require 'spec_helper'

feature "edit questions" do
  let!(:question) {Factory(:question, :ask => "Some question I have.")}

  before do
    visit '/'
    click_link question.ask
    click_link "Revise Question"
  end

  scenario "editing an exisiting quesiton" do
    fill_in "Ask", :with => "Some other question"
    click_button "Update Question"
    page.should have_content("Question has been updated.")
    page.should have_content("Some other question")
  end

  scenario "editing a question with invalid data" do
    fill_in "Ask", :with => ""
    click_button "Update Question"
    page.should have_content("Question has not been updated.")
    page.should have_content("Ask can't be blank")
  end
end
