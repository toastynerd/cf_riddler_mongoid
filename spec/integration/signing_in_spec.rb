require 'spec_helper'

feature "signing in" do
  let!(:user) {Factory(:user, :email => "user@riddler.com", :password => "foobar")}

  scenario "user should be able to sign in via form" do
    visit '/'
    click_link "Sign in"
    fill_in "Email", :with => "user@riddler.com"
    fill_in "Password", :with => "foobar"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end