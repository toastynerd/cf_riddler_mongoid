require 'spec_helper'

feature "Signing Out" do
  scenario "user can sign out" do
    user = Factory(:user)
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    click_link "Sign out"
    current_path.should == root_path
    page.should have_content("Signed out successfully.")
  end
end
