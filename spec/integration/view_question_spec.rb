require 'spec_helper'

feature "view all questions" do
  scenario "list all projects on the index page" do
    question = Factory(:question, :ask => "why?")
    visit '/'
    click_link question.ask
    page.current_url.should == question_url(question)
  end
end