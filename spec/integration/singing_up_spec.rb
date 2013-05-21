require 'spec_helper'

feature "signing in/up" do
  scenario "successfull sign up" do
    visit '/'
    click_link "Sign up"
    fill_in "Email", :with => "user@riddler.com"
    fill_in "Password", :with => "foobar"
    fill_in "Password confirmation", :with => "foobar"
    click_button "Sign up"
    page.should have_content("Welcome! You have signed up successfully.")
  end
end