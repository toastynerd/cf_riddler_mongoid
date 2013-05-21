require 'spec_helper'

feature "create questions" do
  let(:question) {Factory(:question, :ask => "What's up?")}
  let(:user) {Factory(:user, :email => "someguy@riddler.com")}
  before do
    visit '/'
    click_link "Sign in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "foobar"
    click_button "Sign in"
    page.should have_content("Signed in")
    click_link "New Question"
  end

  scenario do
    fill_in "Ask", :with => "Why?"
    fill_in "Detail", :with => "here's the details."
    click_button "Create Question"
    page.should have_content "Question was successfully created."
    within("#author") do
      page.should have_content("someguy@riddler.com")
    end
  end

  scenario do
    fill_in "Ask", :with => ""
    click_button "Create Question"
    page.should have_content "Question could not be created."
    page.should have_content "Ask can't be blank"
  end
end