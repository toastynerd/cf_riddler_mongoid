require 'spec_helper'

feature "delete questions" do
  let!(:question) {Factory(:question, :ask => "a burning quesiton")}

  before do
    visit '/'
    click_link question.ask
  end

  scenario "should be able to delete quesiton" do
    click_link "Delete Question"
    page.should have_content("Question has been deleted.")

    visit '/'
    page.should_not have_content("a burning question")
  end
end
